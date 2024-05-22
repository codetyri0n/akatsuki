vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.relativenumber = true -- gives relative number of lines 
opt.number = true -- tracks line number without zero indexing

opt.tabstop = 4 -- 4 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width 
opt.expandtab = true -- expand tab to spaces 
opt.autoindent = true -- copy indentation level to next line 

opt.wrap = false 

--search settings
opt.ignorecase = true --ignore case of the text when searching
opt.smartcase = true  --assume case-sensitive search if search text is mixed

opt.cursorline = true 

opt.termguicolors = true 
opt.background = "dark"  --colorschemes made dark automatically
opt.signcolumn = "yes"   --show signcolumn so that text does not shift

--backspace
opt.backspace = "indent,eol,start" --allow backspace on indent,eol,start position

--clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

--split windows
opt.splitright = true --split vertical window to the right 
opt.splitbelow = true --split horizontal window to the bottom 






