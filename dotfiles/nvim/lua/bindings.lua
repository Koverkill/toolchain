vim.g.mapleader = " "
vim.g.maplocalleader = " "

map = vim.api.nvim_set_keymap
map('n', '<Leader>ve', ':edit ~/.config/nvim/init.lua<CR>', { noremap = true, silent = true })
map('n', '<Leader>vr', ':source ~/.config/nvim/init.lua<CR>', { noremap = true, silent = true })
map('n', '<C-P>', ':Telescope find_files hidden=true<CR>', { noremap = true, silent = true })
map('n', '<Leader>e', ':NERDTreeToggle<CR><C-w>=', { noremap = true, silent = true })
map('n', '<Leader>a', ':Ack! <cword><CR>', { noremap = true, silent = true })
map('n', '<Leader>q', ':Ack ', { noremap = true, silent = true })


-- map('n', '<Leader>n', ':enew<CR>', { noremap = true, silent = true })
-- map('n', '<Leader>[', ':vertical resize +7<CR>', { noremap = true, silent = true })
-- map('n', '<Leader>]', ':vertical resize -7<CR>', { noremap = true, silent = true })
-- map('n', '<Leader>cc', ':ColorizerToggle<CR>', { noremap = true, silent = true })
-- map('n', '<Leader>b', ':Bracey<CR>', { noremap = true, silent = true })
-- map('n', '<Leader>bb', ':BraceyStop<CR>', { noremap = true, silent = true })
-- map('n', '<Leader>bbb', ':BraceyReload<CR>', { noremap = true, silent = true })
--
 for i = 1, 9, 1 do
     map('n', string.format('<Leader>%d', i),
     string.format('<Cmd>BufferLineGoToBuffer %d<CR>', i),
     { noremap = true, silent = true }
     )
 end

map('n', '<Leader>c', ':BufferLinePickClose<CR>', { noremap = true, silent = true })
map('n', '<Leader>gl', ':BlamerToggle<CR>', { noremap = true, silent = true })

-- map('n', '<TAB>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
-- map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
-- map('n', 'm.', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })
-- map('n', 'm,', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })
-- 
-- map('n', ';j', ':HopWord<CR>', { noremap = true, silent = true })
-- map('n', ';l', ':HopLineStart<CR>', { noremap = true, silent = true })
-- 
-- map('n', '<Leader>dd', ':ToggleDiag<CR>', { noremap = true, silent = true })
-- map("n", "<leader>du", "<Plug>(toggle-lsp-diag-underline)", {silent = true })
-- map("n", "<leader>ds", "<Plug>(toggle-lsp-diag-signs)", {silent = true })
-- map("n", "<leader>dv", "<Plug>(toggle-lsp-diag-vtext)", {silent = true })
-- map("n", "<leader>di", "<Plug>(toggle-lsp-diag-update_in_insert)", {silent = true })
-- 
-- map('n', '<Leader>c', ':CphReceive<CR>', { noremap = true, silent = true })
-- map('n', '<Leader>t', ':CphTest<CR>', { noremap = true, silent = true })
-- for i = 1, 9, 1 do
--   map('n', string.format('<Leader>e%d', i),
--     string.format(':CphEdit %d<CR>', i),
--     { noremap = true, silent = true }
--   )
-- end

-- lsp-config keybindigs
-- vim.cmd("nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>")
-- vim.cmd("nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>")
-- vim.cmd("nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>")
-- vim.cmd("nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>")
-- vim.cmd("nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>")
-- vim.cmd("nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>")
-- vim.cmd("nnoremap <silent> <C-n> <cmd>lua vim.diagnostic.goto_prev()<CR>")
-- vim.cmd("nnoremap <silent> <C-p> <cmd>lua vim.diagnostic.goto_next()<CR>")
-- vim.o.completeopt = "menuone,noselect"

-- map("n", "<F7>", ":NvimTreeToggle<CR>", {silent = true })

-- map('n', '<Leader><Space>', ':noh<CR>', { noremap = true, silent = true })
