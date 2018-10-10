" color scheme
"color tm/Tomorrow-Night-Bright
"color base16/base16-irblack
"color base16/base16-summerfruit-dark
"color base16/base16-isotope
"color base16/base16-monokai
"color base16/base16-summerfruit-light
"color base16/base16-atelier-seaside-light
"color base16/base16-bright
"color default  
"color elflord  
"color elflord_customizing
"color Tomorrow-Night-Bright
"color Tomorrow-Night
"color darkblue
"color industry
color industry_t
"color torte
"color evening
"color evening_customizing
"color tm/Tomorrow-Night-Bright

" tab window settings
set switchbuf=usetab
nnoremap <F10> :tabn<CR>
nnoremap <F9> :tabp<CR>


" my vim settings
" set termguicolors
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

syntax on
set hlsearch
set ignorecase
set softtabstop=4
set shiftwidth=4
autocmd FileType make setlocal noexpandtab
se nu
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4
map <C-a> <esc>ggVG<CR>
map <F1> :w<CR>
map <F2> :w<CR><leader>r<CR>
map <F3> :w<CR>:so %<CR>
map <F4> :q<CR>
map <F5> :qa<CR>
map <F6> :wq<CR>
map <F7> :wqa<CR>
map <C-l> :vsp ~/.vimrc<CR>
map <C-i> :vbash<CR>

" bottom bar theme
"let g:airline_theme='simple'
nnoremap <silent> <C-b> :AirlineToggle<CR>

" my alias
cnoreabbrev install PluginInstall
cnoreabbrev dir NERDTree
cnoreabbrev bash ConqueTermSplit bash
cnoreabbrev vbash ConqueTermVSplit bash
cnoreabbrev list PluginList

" indent line settings
let g:indentLine_color_term = 20
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_tty_light = 7 " (default: 4)
"let g:indentLine_color_dark = 1 " (default: 2)
"let g:indentLine_bgcolor_term = 202
"let g:indentLine_bgcolor_term = 20

" NERDTree settings
let NERDTreeShowHidden=1
nnoremap <silent> <C-p> :NERDTreeToggle<CR>

" coderunner settings
"let g:vcr_languages["py"] = g:vcr_languages["python"]
"let g:vcr_languages["python"] = {
            "\"cmd": "/usr/bin/python3"
"            \}

" Codi settings
let g:codi#rightalign=0
let g:codi#width=40
"let g:codi#interpreters = {'javascript': {
"                       \ 'bin': 'nodejs',},}
let g:codi#interpreters = {'python': {
                       \ 'bin': 'python3',},}
let g:codi#aliases = {'javascript.jsx': 'javascript'}

" Syntax Checker recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
nnoremap <silent> <C-d> :lclose<CR>
cabbrev <silent> bd <C-r>=(getcmdtype()==#':' && getcmdpos()==1 ? 'lclose\|bdelete' : 'bd')<CR>

" ---------------------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
 "Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
" Javascript Syntax
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'othree/javascript-libraries-syntax.vim'
" Javascript Library completer
Plugin 'myhere/vim-nodejs-complete'
" Geek
Plugin 'metakirby5/codi.vim'
" Multi-cursors
Plugin 'terryma/vim-multiple-cursors'
" bottom bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" indent line
Plugin 'yggdroot/indentline'
" code runner - usage:<leader>r
" <leader> : default back slash
Plugin '0x84/vim-coderunner'
" syntax checker
"Plugin 'vim-syntastic/syntastic'

Plugin 'chriskempson/base16-vim'

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

