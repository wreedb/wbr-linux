require('plugins')
require('theme')
require('lualine').setup()

vim.g.mapleader = " "
vim.opt.encoding = "utf-8"
vim.opt.showmode = true
vim.opt.smartcase = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.incsearch = true
vim.opt.tabstop = 2
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.swapfile = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 8
vim.opt.errorbells = false
vim.opt.shiftwidth = 2
vim.opt.numberwidth = 4
vim.opt.termguicolors = true
vim.opt.colorcolumn = '80'
vim.opt.showtabline = 2
vim.opt.signcolumn = 'yes'
vim.opt.mouse = 'a'
vim.opt.guifont = 'JetBrainsMono Nerd Font:h12'

vim.api.nvim_set_keymap('n', '<leader>s',       ':%s/',                               { noremap = true }) -- Substitute mode
vim.api.nvim_set_keymap('n', '<leader>y',       '"+y',                                { noremap = true }) -- Yank to clip
vim.api.nvim_set_keymap('n', '<leader>p',       '"+p',                                { noremap = true }) -- Paste from clip
vim.api.nvim_set_keymap('n', '<leader><Left>',  ':tabprevious<CR>',                   { noremap = true }) -- Tab Previous
vim.api.nvim_set_keymap('n', '<leader><Right>', ':tabnext<CR>',                       { noremap = true }) -- Tab Next
vim.api.nvim_set_keymap('n', '<leader>n',       ':tabnew<CR>',                        { noremap = true }) -- Tab New
vim.api.nvim_set_keymap('n', '<leader>w',       ':w<CR>',                             { noremap = true }) -- Write
vim.api.nvim_set_keymap('n', '<leader>X',       ':q!<CR>',                            { noremap = true }) -- Quit!
vim.api.nvim_set_keymap('n', '<leader>x',       ':wq<CR>',                            { noremap = true }) -- Write Quit
vim.api.nvim_set_keymap('n', '<leader>f',       ':e ~/',                              { noremap = true }) -- Edit ~/...
vim.api.nvim_set_keymap('n', '<leader><Up>',    '<C-Home>',                           { noremap = true }) -- GOTO Top
vim.api.nvim_set_keymap('n', '<leader><Down>',  '<C-End>',                            { noremap = true }) -- GOTO Bottom
vim.api.nvim_set_keymap('n', '<leader>\\',      ':ToggleTerm direction=float<CR>',    { noremap = true }) -- Toggle Floating Terminal
vim.api.nvim_set_keymap('n', '<leader>v',       ':e $HOME/.config/nvim/init.lua<CR>', { noremap = true }) -- Edit Nvim Config
vim.api.nvim_set_keymap('n', '<leader>z',       ':e $HOME/.config/zsh/.zshrc<CR>',    { noremap = true }) -- Edit Nvim Config
