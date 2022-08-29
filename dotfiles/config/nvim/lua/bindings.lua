vim.g.mapleader = " "
vim.g.maplocalleader = " "

map = vim.api.nvim_set_keymap
map('n', '<Leader>ve', ':edit ~/.config/nvim/<CR>', { noremap = true, silent = true })
map('n', '<Leader>vr', ':source %<CR>', { noremap = true, silent = true })
map('n', '<C-P>', ':Telescope find_files hidden=true<CR>', { noremap = true, silent = true })
map('n', '<Leader>e', ':NERDTreeToggle<CR><C-w>=', { noremap = true, silent = true })
map('n', '<Leader>a', ':Ack! <cword><CR>', { noremap = true, silent = true })
map('n', '<Leader>q', ':Ack', { noremap = true, silent = true })

 for i = 1, 9, 1 do
     map('n', string.format('<Leader>%d', i),
     string.format('<Cmd>BufferLineGoToBuffer %d<CR>', i),
     { noremap = true, silent = true }
     )
 end

map('n', '<Leader>c', ':BufferLinePickClose<CR>', { noremap = true, silent = true })
map('n', '<Leader>gl', ':BlamerToggle<CR>', { noremap = true, silent = true })

-- update ctags
map('n', '<F5>', ':!ctags -R --langmap=C:.c.h --languages=C --exclude=tools<CR>', { noremap = true, silent = true })
