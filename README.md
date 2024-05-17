# NeoVim Configuration For Fullstack Java Developers

Welcome to the start, or continuation of your NeoVim journey, I'm excited to have you on board!

This repository holds the configuration code for my simple yet effective NeoVim configuration for Fullstack Java Developers who's primary job is to develop Spring Boot Applications and Frontends using TypeScript and React.

Of course this is just a starting point for you to configure, and just the tip of the ice berg when it comes to customization, so whenever you move onto different languages, or want more features I have designed the structure of the configuratuion to be easily customized.

This configuration repository goes along with my tutorial on how to setup NeoVim for Java Developers, which you can find [here](https://youtu.be/zbpF3te0M3g) to follow along and get explanations of the different plugins we are configuring.

## Plugins

I attempted to keep the plugins in this configuration to a minimum to reduce the bulk, but also to just build a strong foundation to build on top of. I did not want to include a ton of plugins that people might or might not immediately uninstall because they felt they didn't need them.

This configuration uses the ever popular Lazy.nvim to manage the plugins because of the simplicity, popularity, and the great documenation around it. The great thing about this starter and Lazy.nvim in general, is that once you have installed and configured just a few plugins, you will basically know how to install any new plugin you like once you start to add your own tastes.

Below I have listed all the plugins which are included in the configuration, and which I think are almost vital to a great development experience when it comes to Java and TypeScript:

### [Lazy Plugin Manager](https://github.com/folke/lazy.nvim)

A modern plugin manager for NeoVim developed my Folke Lemaitre, a legend in the NeoVim community, you will be seeing more plugins of his make it into the configuration.

### [Dracula ColorScheme](https://github.com/Mofiqul/dracula.nvim)

Everyone needs a color scheme to personalize and escape the drab default colors of NeoVim. My personal favorite is the medium/gray blue with pastelly colors of Dracula. Of course taste in colors is subjective and this can easily be configured to be a different color scheme.

### [Nvim-Tree](https://github.com/nvim-tree/nvim-tree.lua)

Nvim-Tree is a file explorer plugin for Neovim, providing a convenient and visually appealing way to navigate and manage files and directories within your project directly from the Neovim interface. It offers features like directory tree view, file operations, and customizable key bindings for efficient file manipulation.

### [Telescope](https://github.com/nvim-telescope/telescope.nvim)

Telescope is a versatile Neovim plugin for fuzzy finding and browsing various data, such as files, buffers, git files, and more, within your project. It offers a streamlined interface for searching, previewing, and selecting items using fuzzy search algorithms, enabling efficient navigation and interaction with your Neovim environment.

### [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

Treesitter is a Neovim plugin that provides advanced syntax highlighting and parsing capabilities based on the Tree-sitter parsing library. It offers improved accuracy and performance compared to traditional regex-based syntax highlighting, enabling features like better code comprehension, enhanced code navigation, and contextual understanding within Neovim.

### [Mason](https://github.com/williamboman/mason.nvim)

Mason.nvim is a Neovim plugin specifically focused on managing Language Server Protocol (LSP) binaries. It automates the installation and management of these binaries, making it easier for Neovim users to set up and use language servers for features like code completion, syntax checking, and more. This plugin simplifies the configuration process, ensuring a smoother integration of language server capabilities within Neovim.

### [Mason LSP Config](https://github.com/williamboman/mason-lspconfig.nvim)

Mason-lspconfig.nvim is a Neovim plugin designed to work in conjunction with Mason.nvim for managing Language Server Protocol (LSP) configurations. It provides a set of pre-configured settings for various programming languages and frameworks, making it easier to set up and use language servers within Neovim. This plugin simplifies the process of configuring LSP servers by offering ready-made configurations tailored to different development environments, improving productivity for Neovim users.

### [Nvim JDTLS](https://github.com/mfussenegger/nvim-jdtls)

Nvim-jdtls is a Neovim plugin that integrates the Java language server (JDTLS) with Neovim, providing features like code completion, syntax checking, and refactoring for Java development within the Neovim environment. It leverages the Language Server Protocol (LSP) to offer intelligent code assistance and navigation tools, enhancing the Java development experience for Neovim users.

### [Lsp Config](https://github.com/neovim/nvim-lspconfig)

Nvim-lspconfig is a Neovim plugin that simplifies the configuration of Language Server Protocol (LSP) servers within Neovim. It provides a straightforward interface to set up and manage various language servers for features like code completion, syntax checking, and more. This plugin streamlines the integration of LSP capabilities into Neovim, enhancing the development experience for users across different programming languages and frameworks.

### [Nvim Dap](https://github.com/mfussenegger/nvim-dap)

Nvim-dap is a Neovim plugin that brings debugger integration to Neovim, allowing users to debug their code directly within the editor. It implements the Debug Adapter Protocol (DAP), providing features such as breakpoints, variable inspection, stepping through code, and more. This plugin enhances the development workflow by offering a seamless debugging experience within the Neovim environment.

### [Spring Boot Nvim](https://github.com/elmcgill/springboot-nvim)

Spring Boot Nvim is a NeoVim plugin that brings quality of life features to Java/Spring Boot developers. It sets up a convient way to map a keybinding to run Spring Boot applications in a new terminal window. Automatically adds package declarations to new files. Incrementally compiles the Java project on save to enable Spring Boot DevTools to work properly, and provides convient ways to create new classes, enums and interfaces, with more features to come.

### [None-LS](https://github.com/nvimtools/none-ls.nvim)

None-ls is a Neovim plugin that facilitates language server protocol (LSP) support for languages that lack dedicated language servers. It provides a generic solution for syntax checking, code completion, and other language-specific features by leveraging external tools or scripts. This plugin extends Neovim's capabilities to a wider range of programming languages, enhancing the editing experience for users working with less common or unsupported languages.

### [LuaSnip](https://github.com/L3MON4D3/LuaSnip)

Luasnip is a Neovim plugin that enhances snippet support within the editor. It allows users to define and expand snippets of code quickly using simple triggers and placeholders. Luasnip offers a customizable and efficient way to insert commonly used code patterns, reducing typing and improving productivity during coding sessions.

### [Cmp LuaSnip](https://github.com/saadparwaiz1/cmp_luasnip)

Cmp_luasnip is a Neovim plugin that integrates the Luasnip snippet engine with the nvim-cmp completion framework. It enhances the completion experience by allowing users to expand snippets while typing, providing quick access to predefined code snippets within the context of code completion. This plugin streamlines the process of inserting and using snippets alongside other completion sources in Neovim, improving productivity during coding sessions.

### [Friendly Snippets](https://github.com/rafamadriz/friendly-snippets)

Friendly Snippets is a Neovim plugin designed to simplify the creation and management of code snippets. It provides a collection of predefined snippets for various programming languages and frameworks, making it easier for users to insert common code patterns with minimal effort. Friendly Snippets enhances the coding experience in Neovim by offering a library of reusable code snippets accessible through simple triggers, thereby improving productivity and reducing typing efforts during coding sessions.

### [Cmp Nvim LSP](https://github.com/hrsh7th/cmp-nvim-lsp)

Cmp-nvim-lsp is a Neovim plugin that integrates the nvim-cmp completion framework with the built-in Language Server Protocol (LSP) client in Neovim. It enhances code completion by providing intelligent suggestions based on the capabilities of LSP servers for various programming languages. This plugin enables seamless integration of LSP-powered completion features into Neovim, improving the development experience by offering context-aware suggestions and enhancing productivity during coding sessions.

### [Nvim Cmp](https://github.com/hrsh7th/nvim-cmp)

Nvim-cmp is a powerful completion framework for Neovim that enhances code completion capabilities within the editor. It provides a fast and customizable interface for context-aware completion suggestions, supporting various completion sources such as language servers, snippets, and more. nvim-cmp improves the development workflow by offering intelligent and efficient code completion features, helping users write code faster and with fewer errors.

### [Cmp Buffer](https://github.com/hrsh7th/cmp-buffer)

Cmp-buffer is a Neovim plugin that extends the functionality of the nvim-cmp completion framework by adding a completion source that suggests items from currently open buffers. It enhances code completion by providing suggestions based on the contents of buffers, allowing users to quickly access and insert previously written code snippets or references within their current editing session. This plugin further enriches the completion experience in Neovim, offering a convenient way to access and reuse code from existing buffers while writing new code.

### [Cmp Path](https://github.com/hrsh7th/cmp-path)

Cmp-path is a Neovim plugin designed to enhance the completion capabilities of the nvim-cmp completion framework by adding a completion source that suggests file paths relative to the current working directory. It facilitates code completion by providing quick access to files within the project directory structure, allowing users to efficiently navigate and include file paths in their code without manually typing them out. This plugin contributes to a smoother development workflow in Neovim by offering context-aware file path suggestions, thereby improving productivity and reducing typing efforts during coding sessions.

### [Autopairs](https://github.com/windwp/nvim-autopairs)

Autopairs is a Neovim plugin that automates the insertion of matching pairs of characters, such as parentheses, brackets, and quotes. It enhances the editing experience by automatically inserting closing characters when an opening character is typed, and vice versa, thereby reducing the need for manual typing and minimizing errors in code formatting. This plugin streamlines the process of writing code in Neovim by providing intelligent and context-aware pairing of characters, improving productivity and code consistency for users.

### [Git Signs](https://github.com/lewis6991/gitsigns.nvim)

Git Signs is a Neovim plugin that provides Git integration by displaying signs in the gutter area to indicate Git changes within a file. It offers visual cues such as added, modified, or deleted lines, as well as highlighting the changes since the last commit. This plugin enhances the version control experience in Neovim, allowing users to quickly identify and navigate Git changes within their codebase, improving productivity and code management workflows.

### [Fugitive](https://github.com/tpope/vim-fugitive)

Fugitive is a comprehensive Git wrapper for Neovim, providing a wide range of Git commands and features directly within the editor. It allows users to execute Git commands, view Git status, manage branches, diff changes, and interact with the Git history seamlessly from within Neovim. Vim-fugitive enhances the version control experience by integrating Git functionalities into the editor, streamlining the development workflow and improving productivity for Git users.

### [Lualine](https://github.com/nvim-lualine/lualine.nvim)

Lualine is a Neovim plugin that provides a customizable and feature-rich statusline. It offers various components and themes to display information such as file path, Git branch, mode indicator, and more in the statusline. Lualine enhances the visual appearance of Neovim and provides useful information to users, improving their editing experience and productivity.

### [Which-key](https://github.com/folke/which-key.nvim)

Which-key is a Neovim plugin that helps users discover and remember key mappings by displaying a popup window that lists available keybindings when a partial key sequence is entered. It provides a convenient way to explore and learn key mappings within Neovim, improving users' efficiency and reducing the need to memorize complex key combinations. This plugin enhances the discoverability of commands and keybindings, facilitating a smoother and more intuitive editing experience in Neovim.

### [Harpoon](https://github.com/ThePrimeagen/harpoon)

Harpoon is a Neovim plugin designed to simplify navigation within projects by providing quick access to frequently used files and directories. It offers a sidebar interface that allows users to bookmark and organize project files, making it easier to navigate between different parts of the project. Harpoon enhances productivity in Neovim by streamlining the process of jumping between files and directories within a project, thereby improving the development workflow.

### [Comment](https://github.com/numToStr/Comment.nvim)

Comment is a Neovim plugin that enhances code commenting functionality by providing intuitive and customizable key mappings for commenting and uncommenting code blocks. It supports various comment styles for different programming languages and offers features like toggling comments, commenting out entire lines, and handling nested comments efficiently. comment.nvim streamlines the commenting process in Neovim, improving code readability and productivity for users during development.

## Support

Consider supporting me on social media for putting this configuration together

[Youtube](https://www.youtube.com/channel/UCOVeQepH1fCRgxeH6kuz7OQ)

[Twitter](https://www.twitter.com/UnknownKoder)

[Twitch](https://www.twitch.tv/unknownkoderyt)
