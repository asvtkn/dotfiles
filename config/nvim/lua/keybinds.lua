-- file shortcuts
vim.keymap.set('n', '<leader>ee', ":e ~/.config/nvim/init.lua<cr>")
vim.keymap.set('n', '<leader>es', ":e ~/.config/nvim/lua/settings.lua<cr>")
vim.keymap.set('n', '<leader>ek', ":e ~/.config/nvim/lua/keybinds.lua<cr>")
vim.keymap.set('n', '<leader>ep', ":e ~/.config/nvim/lua/plugins/<cr>")
vim.keymap.set('n', '<leader>et', ":e ~/.config/nvim/lua/plugins/colorscheme.lua<cr>")
vim.keymap.set('n', '<leader>el', ":e ~/.config/nvim/lua/lazyinit.lua<cr>")
vim.keymap.set('n', '<leader>et', ":e ~/.tmux.conf<cr>")
vim.keymap.set('n', '<leader>ez', ":e ~/.zshrc<cr>")
vim.keymap.set('n', '<leader>ee', ":e ~/dotfiles<cr>")
vim.keymap.set('n', '<leader>en', ":Oil ~/dotfiles/note.txt<cr>")

-- projects
vim.keymap.set('n', '<leader>e1', ":e ~/code/projects/ts-diag/<cr>")
vim.keymap.set('n', '<leader>e2', ":e ~/code/src/stall_guru/<cr>")


vim.keymap.set('n', '<leader>1', ":Lazy<cr>")
vim.keymap.set('n', '<leader>2', ":FzfLua<cr>")
vim.keymap.set('n', '<leader>3', ":Mason<cr>")
vim.keymap.set('n', '<leader>/', ":Oil<cr>")
vim.keymap.set('n', "<leader>t", ":Neotree toggle right<cr>")

-- alternate file with backspace
vim.keymap.set('n', '<backspace>', '<c-^>')

-- TODO
-- vim.keymap.set('n', '<leader><leader>w', ":set wrap") -- TODO

-- move up/down in wrapped lines
vim.keymap.set('n', '<down>', 'gj')
vim.keymap.set('n', '<up>', 'gk')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- split panes
vim.keymap.set('n', '<c-/>', ':split<CR>', { silent = true })
vim.keymap.set('n', '<c-\'>', ':vsplit<CR>', { silent = true })

-- window navigation
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- < and > to navigate buffers
vim.keymap.set('n', '<c-,>', ':bprev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-.>', ':bnext<CR>', { noremap = true, silent = true })

-- single press of < and > to shift line(s)
vim.keymap.set('n', '>', '>>', { noremap = true, silent = true })
vim.keymap.set('n', '<', '<<', { noremap = true, silent = true })
-- stay in visual mode after shifting line(s)
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })

-- when yanking, copy to clipboard
-- vim.keymap.set('v', '<leader>y', '"+y')
-- vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', 'y', '"+y')
vim.keymap.set('v', 'd', '"+d')
vim.keymap.set('n', 'yy', '"+yy')

-- change directory
vim.keymap.set('n', '<leader>cd', function()
    if vim.startswith(vim.api.nvim_buf_get_name(0), "oil://") then
        vim.cmd("norm ~")
    else
        vim.cmd("cd %:p:h")
        vim.cmd("pwd")
    end
end)


-- type • faster
vim.keymap.set('i', '<A-8>', '•', { noremap = true, silent = true })
vim.keymap.set('n', 'r<A-8>', 'r•', { noremap = true, silent = true })

-- move lines faster
vim.keymap.set('n', '<c-n>', 'ddp')
vim.keymap.set('n', '<c-p>', 'ddkP')

-- FZF LUA HANDLE SESSIONS

--
-- plugins init
--

-- telescope
-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


-- toggle search highlight
vim.keymap.set('n', '<leader><leader>h',
    function()
        vim.v.hlsearch = vim.v.hlsearch ~= 1
        vim.notify("hlsearch: " .. (vim.v.hlsearch == 1 and "on" or "off"))
    end
)


-- vim.keymap.set('n', '<leader>f', ":FzfLua live_grep<cr>")
vim.keymap.set('n', '<leader>o', ":FzfLua files<cr>")
-- vim.keymap.set('n', '<leader>b', ":FzfLua buffers<cr>")

-- persisted.nvim
-- vim.keymap.set('n', '<leader>ss', ':SessionSave ')
-- vim.keymap.set('n', '<leader>sl', ':SessionSearch<cr>')
-- vim.keymap.set('n', '<leader>sr', ':SessionRestore ')
-- vim.keymap.set('n', '<leader>sd', ':SessionDelete ')

-- zen-node.nvim
vim.keymap.set('n', '<leader>z', ":ZenMode<cr>")



-- fzf-lua
vim.keymap.set({ "i" }, "<C-x><C-f>",
    function()
        require("fzf-lua").complete_file({
            cmd = "rg --files",
            winopts = { preview = { hidden = true } }
        })
    end, { silent = true, desc = "Fuzzy complete file" })

-- LSP
vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration)
vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>lk", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader><leader>f", function()
    vim.lsp.buf.format({ async = true })
end)
-- Diagnostic keymaps
vim.keymap.set("n", "<leader>n", function()
    vim.diagnostic.jump({ count = 1, float = true })
end)

vim.keymap.set("n", "<leader>p", function()
    vim.diagnostic.jump({ count = -1, float = true })
end)
-- vim.keymap.set("n", "<leader>n", vim.diagnostic.jump({count=1, float=true}))
-- vim.keymap.set("n", "<leader>p", vim.diagnostic.jump({count=-1, float=true}))
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
