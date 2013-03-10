" first of all, invaluable:
" http://learnvimscriptthehardway.stevelosh.com

" General formatting and indenting {{{
filetype plugin indent on
syntax on

set nocompatible
set nowrap
set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set scrolloff=4

set nobackup
set nowritebackup
set noswapfile

set colorcolumn=80
" }}}

" The colors {{{
colorscheme solarized
set background=dark
set t_Co=16
" }}}

" Drupal special filetype settings {{{
augroup drupal
	autocmd!
	autocmd BufRead,BufNewFile *.module set filetype=php
	autocmd BufRead,BufNewFile *.theme set filetype=php
	autocmd BufRead,BufNewFile *.inc set filetype=php
	autocmd BufRead,BufNewFile *.install set filetype=php
	autocmd BufRead,BufNewFile *.info set filetype=php
	autocmd BufRead,BufNewFile *.engine set filetype=php
	autocmd BufRead,BufNewFile *.profile set filetype=php
	autocmd BufRead,BufNewFile *.test set filetype=php
augroup END
" }}}

" Vimscript file settings {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Other autocommands, etc. {{{
augroup misc_aus
"" This beauty remembers where you were the last time you edited the file,
"" and returns to the same position.
	autocmd!
	autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
augroup END
" }}}

" Custom functions {{{
fu! Matt_phphtmlformat()
	:set ft=html
	:normal gg=G
	:set ft=php
	:normal gg=G
	:filetype detect
endfunction
" }}}

" Remapping {{{
let mapleader = "-"

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

inoremap jk <esc>

inoremap <Up> <nop>
inoremap <Right> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>

noremap <F2> :TlistToggle<CR>
noremap <F3> :NERDTreeToggle<CR>

noremap <F4> :call Matt_phphtmlformat()<CR>

" insert mode uppercase-ify words
inoremap <c-u> <esc>viwU<esc>ea
" insert mode uppercase-ify words
nnoremap <c-u> viwU<esc>e

"}}}

" Status line {{{
set laststatus=2
set statusline=%f%m					" relative file path with modified thingy
set statusline+=\ ((%F))		" absolute file path
set statusline+=%=					" right align from here
set statusline+=%l/%L				" current line / total lines
" }}}

" Misc {{{
" This prevents VimIRC from being loaded normally
" let loaded_vimirc=1
" }}}
