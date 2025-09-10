return {
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
        local fzf = require("fzf-lua")
        local config = fzf.config
        local actions = fzf.actions

        return {
            "border-fused",
            fzf_colors = true,
            fzf_opts = {
                -- ["--no-scrollbar"] = true,
            },
            defaults = {
                -- formatter = "path.filename_first",
                formatter = "path.dirname_first",
            },
            winopts = {
                width = 0.8,
                height = 0.8,
                row = 0.5,
                col = 0.5,
                preview = {
                    -- scrollchars = { "┃", "" },
                },
            },
            files = {
                cwd_prompt = false,
                actions = {
                    ["alt-i"] = { actions.toggle_ignore },
                    ["alt-h"] = { actions.toggle_hidden },
                },
            },
            grep = {
                actions = {
                    ["alt-i"] = { actions.toggle_ignore },
                    ["alt-h"] = { actions.toggle_hidden },
                },
            },
        }
    end,
    keys = {
        { "<leader>f:", "<cmd>FzfLua command_history<cr>",                          desc = "Command History" },
        -- find
        { "<leader>ff", "<cmd>FzfLua live_grep<cr>",                                desc = "Live Grep" },
        { "<leader>fo", "<cmd>FzfLua files<cr>",                                    desc = "Files" },
        { "<leader>fb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
        { "<leader>fg", "<cmd>FzfLua git_files<cr>",                                desc = "Git Files" },
        { "<leader>fr", "<cmd>FzfLua oldfiles<cr>",                                 desc = "Recent(Old) files" },
        { "<leader>fc", "<cmd>FzfLua colorschemes<cr>",                             desc = "Colorschemes" },
        -- git
        { "<leader>fgc", "<cmd>FzfLua git_commits<CR>",                              desc = "Commits" },
        { "<leader>fgs", "<cmd>FzfLua git_status<CR>",                               desc = "Status" },
        -- search
        { '<leader>s"', "<cmd>FzfLua registers<cr>",                                desc = "Registers" },
        { "<leader>sa", "<cmd>FzfLua autocmds<cr>",                                 desc = "Auto Commands" },
        { "<leader>sb", "<cmd>FzfLua grep_curbuf<cr>",                              desc = "Buffer" },
        { "<leader>sc", "<cmd>FzfLua command_history<cr>",                          desc = "Command History" },
        { "<leader>sC", "<cmd>FzfLua commands<cr>",                                 desc = "Commands" },
        { "<leader>sd", "<cmd>FzfLua diagnostics_document<cr>",                     desc = "Document Diagnostics" },
        { "<leader>sD", "<cmd>FzfLua diagnostics_workspace<cr>",                    desc = "Workspace Diagnostics" },
        { "<leader>sh", "<cmd>FzfLua help_tags<cr>",                                desc = "Help Pages" },
        { "<leader>sH", "<cmd>FzfLua highlights<cr>",                               desc = "Search Highlight Groups" },
        { "<leader>sj", "<cmd>FzfLua jumps<cr>",                                    desc = "Jumplist" },
        { "<leader>sk", "<cmd>FzfLua keymaps<cr>",                                  desc = "Key Maps" },
        { "<leader>sl", "<cmd>FzfLua loclist<cr>",                                  desc = "Location List" },
        { "<leader>sM", "<cmd>FzfLua man_pages<cr>",                                desc = "Man Pages" },
        { "<leader>sm", "<cmd>FzfLua marks<cr>",                                    desc = "Jump to Mark" },
        { "<leader>sR", "<cmd>FzfLua resume<cr>",                                   desc = "Resume" },
        { "<leader>sq", "<cmd>FzfLua quickfix<cr>",                                 desc = "Quickfix List" },
    },
}
