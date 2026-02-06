--- disable netrw to prevent interfering with nvim-tree
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

require('config.lazy')

vim.cmd[[colorscheme tokyonight-night]]
