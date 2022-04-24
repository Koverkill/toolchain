local options = {
    clipboard = "unnamedplus",               
    cmdheight = 2,                           
    completeopt = { "menuone", "noselect" }, 
    expandtab = true,                        
    fileencoding = "utf-8",                  
    guifont = "monospace:h17",               
    hlsearch = true,                         
    ignorecase = true,                       
    mouse = "a",                             
    swapfile = false,
    number = true,                          
    numberwidth = 4,                        
    pumheight = 10,                        
    scrolloff = 8,                       
    shiftwidth = 4,
    softtabstop = 4,
    sidescrolloff = 8,
    signcolumn = "yes",                      
    showtabline = 2,                         
    smartcase = true,                        
    smartindent = true,                      
    splitbelow = true,                       
    splitright = true,                       
    swapfile = false,                        
    updatetime = 300,                        
    wrap = false,                            
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
