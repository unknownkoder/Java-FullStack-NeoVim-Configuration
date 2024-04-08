local M = {}

function M.setup()
    local function get_jdtls()
        local mason_registry = require "mason-registry"
        local jdtls = mason_registry.get_package "jdtls"
        local jdtls_path = jdtls:get_install_path()
        local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
        local SYSTEM = "linux"
        local config = jdtls_path .. "/config_" .. SYSTEM
        local lombok = jdtls_path .. "/lombok.jar"
      return launcher, config, lombok
    end

    local function get_bundles()
        local mason_registry = require "mason-registry"
        local java_debug = mason_registry.get_package "java-debug-adapter"
        local java_test = mason_registry.get_package "java-test"
        local java_debug_path = java_debug:get_install_path()
        local java_test_path = java_test:get_install_path()
        local bundles = {}
        vim.list_extend(bundles, vim.split(vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"), "\n"))
        vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar"), "\n"))
        return bundles
    end

    local function get_workspace()
        local home = os.getenv "HOME"
        local workspace_path = home .. "/code/workspace/"
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
        local workspace_dir = workspace_path .. project_name
        return workspace_dir
    end

    local jdtls = require "jdtls"
    local jdtls_setup = require("jdtls.setup")
    local capabilities = {
        workspace = {
            configuration = true
        },
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = false
                }
            }
        }
    }
    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

    for k,v in pairs(lsp_capabilities) do capabilities[k] = v end

    local extendedClientCapabilities = jdtls.extendedClientCapabilities
    extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

    local launcher, os_config, lombok = get_jdtls()
    local workspace_dir = get_workspace()
    local bundles = get_bundles()

    local on_attach = function(_, bufnr)
        vim.lsp.codelens.refresh()
        jdtls.setup_dap { hotcodereplace = "auto"}
        require("jdtls.dap").setup_dap_main_class_configs()
        require("jdtls.setup").add_commands()

        local java_keymaps = function()
           vim.cmd(
              "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)"
            )
            vim.cmd(
              "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)"
            )
            vim.cmd("command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()")
            vim.cmd("command! -buffer JdtJol lua require('jdtls').jol()")
            vim.cmd("command! -buffer JdtBytecode lua require('jdtls').javap()")
            vim.cmd("command! -buffer JdtJshell lua require('jdtls').jshell()")

            vim.keymap.set('n', '<leader>Jo', "<Cmd> lua require('jdtls').organize_imports()<CR>", {desc = "Java Organize Imports"})
            vim.keymap.set('n', '<leader>Jv', "<Cmd> lua require('jdtls').extract_variable()<CR>", {desc = "Java Extract Variable"})
            vim.keymap.set('v', '<leader>Jv', "<Esc><Cmd> lua require('jdtls').extract_variable(true)<CR>", {desc = "Java Extract Variable"})
            vim.keymap.set('n', '<leader>JC', "<Cmd> lua require('jdtls').extract_constant()<CR>", {desc = "Java Extract Constant"})
            vim.keymap.set('v', '<leader>JC', "<Esc><Cmd> lua require('jdtls').extract_constant(true)<CR>", {desc = "Java Extract Constant"})
            vim.keymap.set('n', '<leader>Jt', "<Cmd> lua require('jdtls').test_nearest_method()<CR>", {desc = "Java Test Method"})
            vim.keymap.set('v', '<leader>Jt', "<Esc><Cmd> lua require('jdtls').test_nearest_method(true)<CR>", {desc = "Java Test Method"})
            vim.keymap.set('n', '<leader>JT', "<Cmd> lua require('jdtls').test_class()<CR>", {desc = "Java Test Class"})
            vim.keymap.set('n', '<leader>Ju', "<Cmd> JdtUpdateConfig<CR>", {desc = "Java Update Config"})
        end

        java_keymaps()
        vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = {"*.java"},
            callback = function()
                local _, _ = pcall(vim.lsp.codelens.refresh)
            end,
        })
    end

    local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
    local root_dir = jdtls_setup.find_root(root_markers)

    local config = {
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-Xms1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
          "-javaagent:" .. lombok,
          "-jar",
          launcher,
          "-configuration",
          os_config,
          "-data",
          workspace_dir,
        },
        root_dir = root_dir,
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            java = {
                autobuild = {enabled = false},
                format = {
                    enabled = true,
                    settings = {
                        url = vim.fn.stdpath("config")  .. "/lang_servers/intellij-java-google-style.xml",
                        profile = "GoogleStyle"
                    }
                },
                eclipse = {
                    downloadSource = true
                },
                maven = {
                    downloadSources = true
                },
                signatureHelp = {
                    enabled = true
                },
                contentProvider = {
                    preferred = "fernflower"
                },
                saveActions = {
                    organizeImports = true
                },
                completion = {
                    favoriteStaticMembers = {
                        "org.hamcrest.MatcherAssert.assertThat",
                        "org.hamcrest.Matchers.*",
                        "org.hamcrest.CoreMatchers.*",
                        "org.junit.jupiter.api.Assertions.*",
                        "java.util.Objects.requireNonNull",
                        "java.util.Objects.requireNonNullElse",
                        "org.mockito.Mockito.*",
                    },
                    filteredTypes = {
                        "com.sun.*",
                        "io.micrometer.shaded.*",
                        "java.awt.*",
                        "jdk.*",
                        "sun.*",
                    },
                    importOrder = {
                        "java",
                        "javax",
                        "com",
                        "org",
                    }
                },
                sources = {
                    organizeImports = {
                        starThreshold = 9999,
                        staticThreshold = 9999
                    }
                },
                codeGeneration = {
                    toString = {
                        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
                    },
                    hashCodeEquals = {
                        useJava7Objects = true
                    },
                    useBlocks = true
                },
                configuration = {
                    updateBuildConfiguration = "interactive"
                },
                implentationCodeLens = {
                    enabled = true
                },
                referencesCodeLens = {
                    enabled = true
                },
                inlayHints = {
                    parameterNames = {
                        enabled = "all"
                    }
                }
            }
        },
        init_options = {
            bundles = bundles,
            extendedClientCapabilities = extendedClientCapabilities
        }
    }

    require("jdtls").start_or_attach(config);
end

return M
