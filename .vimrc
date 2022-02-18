set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

"for jshint run on save
Plugin 'Shutnik/jshint2.vim'
"Plugin 'wookiehangover/jshint.vim'
"let jshint2_save=1

"for eslint linting
Plugin 'vim-syntastic/syntastic'
let g:syntastic_javascript_checkers=['eslint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_check_on_w = 0

" for python pep8 linting
" need to have flake8 installed in python (virtual) env for this to work
" Plugin 'nvie/vim-flake8'
" run it everytime you save a python file
" autocmd BufWritePost *.py call flake8#Flake8()


function! FindConfig(prefix, what, where)
    let cfg = findfile(a:what, escape(a:where, ' ') . ';')
    return cfg !=# '' ? ' ' . a:prefix . ' ' . shellescape(cfg) : ''
endfunction

autocmd FileType javascript let b:syntastic_javascript_jscs_args =
    \ get(g:, 'syntastic_javascript_eslint_args', '') .
    \ FindConfig('-c', '.eslintrc.js', expand('<afile>:p:h', 1))

"for javascript coding
Plugin 'pangloss/vim-javascript'

"nice statusline
Plugin 'bling/vim-airline'
set laststatus=2
set ttimeoutlen=50

"nice searching inside files
Plugin 'rking/ag.vim' 

"play nice with markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

"for golang syntax 
Plugin 'fatih/vim-go'

Plugin 'avakhov/vim-yaml'

" vim notes plugin
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'

" for typescript
Plugin 'leafgarland/typescript-vim'

" for terraform file editing
Plugin 'hashivim/vim-terraform'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"^^ all for vundle 

"for pathogen: 
execute pathogen#infect()

"for NERDtree
map <C-a> :NERDTreeToggle<CR>


"for myself: 
filetype plugin indent on

set rnu
syntax enable

"so that cntrl-j does the same as c-w-j 
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"so that jj becomes escape in insert mode
:imap jj <Esc>

"to edit handlebars
au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars

"for as31 syntax highlighting 
"redefine assembly (asm) as the custom as31 filetype 
au BufNewFile,BufRead *.asm set filetype=as31

"for latex files, set the text width to 80
au BufRead,BufNewFile *.tex setlocal textwidth=80
au BufRead,BufNewFile *.tex setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au BufRead,BufNewFile *.tex set ft=tex

"to edit json like js 
"autocmd BufNewFile,BufRead *.json set ft=javascript

"for javascript .js files 
autocmd Filetype javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

autocmd Filetype python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

"For ctrP fuzzy finder
set runtimepath^=~/.vim/bundle/ctrlp.vim

"so ctrl - p 
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"ignore temp files 
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

"starts working in parent dir, or current dir if no parent, 
"where parent is directory that contiains .git 
let g:ctrlp_working_path_mode = 'ra'

"for fuzzy line search
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']


"for silver searcher: 
let g:ackprg = 'ag --nogroup --nocolor --column'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
