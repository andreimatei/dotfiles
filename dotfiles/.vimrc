""""""""""""" Vundle stuff

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'godoctor/godoctor.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'qpkorr/vim-bufkill'
Plugin 'ap/vim-buftabline'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-sensible'
Plugin 'bronson/vim-visual-star-search'
" Make CMD+W close buffers.
Plugin 'git://github.com/nathanaelkane/vim-command-w.git'
" Git plugin.
Plugin 'tpope/vim-fugitive'
" Go from code to Github with gho
Plugin 'prakashdanish/vim-githubinator'
" Automatically highlight the identifier under the cursor.
Plugin 'RRethy/vim-illuminate'
Plugin 'irfansharif/vim-crlfmt'
" Open line(s) in GitHub with <leader>gh
Plugin 'ruanyl/vim-gh-line'
" Control the font size in GVim.
Plugin 'drmikehenry/vim-fontsize'
" Map + and _ (Shift + '-') to increase and decrease the font size.
nmap <silent> + <Plug>FontsizeInc
nmap <silent> _ <Plug>FontsizeDec

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

"""""""""""""" Vundle END

set background=light
syntax on


set hlsearch
set number
set ignorecase " cautarea sa fie case-insensitive
set smartcase  " daca pun totusi cel putin un caracter uppercase in search, atunci sa fie case sensitive
set tabstop=2
set shiftwidth=2
set expandtab


map .h :noh<CR>" dupa ce caut ceva, sa apas ".h" si sa dispara highlight-ul
set showtabline=2

" Removes trailing spaces
" function TrimWhiteSpace()
" : %s/\s\+$//
" :endfunction

" ,cd to change to the directory of the current file
map ,cd :cd %:p:h<CR>

" map <F2>    :call TrimWhiteSpace()<CR>
" map! <F2>    :call TrimWhiteSpace()<CR>

" tab navigation
map <A-w> :BD<CR>
map <M-Left> :bp<CR> 
map! <M-Left> :bp<CR> 
map <M-Right> :bn<CR> 
map! <M-Right> :bn<CR> 
map <C-n> :cn<CR>

" get the .swp files out of the way
set directory=/home/andrei/.swp

set tags=./tags,./../tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags

autocmd Filetype c setlocal noexpandtab shiftwidth=8
" Strip trailing whitespace for source files on save.
autocmd FileType c,cpp,go autocmd BufWritePre <buffer> %s/\s\+$//e

autocmd Filetype go setlocal tabstop=2 shiftwidth=2 
" Use gopls for vim-go's :GoDef. I was using guru before.
" alternative: let g:go_def_mode = 'guru'
" alternative: let g:go_def_mode = 'godef'
let g:go_def_mode = 'gopls'
" Required so that go_def_mode='guru' doesn't clobber my GOPATH. https://github.com/fatih/vim-go/issues/1274
let g:go_autodetect_gopath = 0
let g:go_bin_path = '/home/andrei/work/bin'

" YCM go-to-definition as an alternative to vim-go.
autocmd FileType go nmap yd :YcmCompleter GoTo<CR>
autocmd Filetype proto setlocal expandtab tabstop=2 shiftwidth=2 

autocmd BufNewFile,BufRead */sql/testdata/* set filetype=sh
autocmd BufNewFile,BufRead */sql/partestdata/* set filetype=sh
" Go-to-definition in .y file.
autocmd BufNewFile,BufRead sql.y nmap gd /^<C-R><C-W>:<C-M>

" ******  Go stuff  *********

" Run goimports on save.
let g:go_fmt_command = "goimports"
" Make space print the type of variable or function.
au FileType go nmap <Space> <Plug>(go-info)

" Automatically format comments to 80 lines.
autocmd FileType go set number fo+=croq tw=80
autocmd Filetype go set makeprg=go\ build\ .

autocmd FileType md set number fo+=croq tw=80

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

set exrc

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Change the nested comment placeholders used by NerdCommenter. Otherwise, it
" messes up in go sources - when commenting a line with a C-style comment in it,
" it will replace the C-style comment delimiters with some random placeholder
" for no reason, and then it will not change it back when uncommenting.
let g:NERDLPlace='/*'
let g:NERDRPlace='*/'


" also read .vimrc from the cwd, allowing it to override settings.
" Used to override the directory setting, so the swap dir doesn't overlap
" between sessions.
set exrc

" Increase some syntax highlighting mem limit that was being exceeded by large
" files. Default was 1000.
set maxmempattern=10000

" From Radu. See https://github.com/irfansharif/vim-crlfmt/pull/1
let g:crlfmt_options = ' -ignore ".*.pb(.gw)?.go" -tab 2'

:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
