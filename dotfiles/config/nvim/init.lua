-- insures packer is installed
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

require("general")
require("bindings")
require("xirgo")

-- include plugins and their config
require('plugins')
require('plug_config.tokyonight')
require('plug_config.lualine')
require('plug_config.bufferline')
require('plug_config.telescope')
require('plug_config.nerdtree')
require('plug_config.nerdcommenter')
require('plug_config.toggleTerm')
require('plug_config.ack')
require('plug_config.blamer')
--require('plug_config.vimwiki')
require('plug_config.treesitter')
require('plug_config.glow')
