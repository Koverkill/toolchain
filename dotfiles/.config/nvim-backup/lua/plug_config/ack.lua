-- Ack
vim.cmd[[
cnoreabbrev Ack Ack!
if executable('rg')
" use ripgrep for ack
    let g:ackprg = 'rg --vimgrep --no-heading -F -E UTF-8 -t c --no-sort-files -g !"tags/**" -g !"tools/**" -g !"ewp/**" -g !"build/**" -g !"libraries/aws_iot/**" -g !"libraries/mbedtls/**"'
endif
]]
