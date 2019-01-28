" vim theme
color jellybeans

" ctags setting
"set tags=tags

" tab window settings
set switchbuf=usetab
nnoremap <F10> :tabn<CR>
nnoremap <F9> :tabp<CR>

" custom vim settings
set encoding=utf-8
set foldmethod=syntax
set nofoldenable
set hlsearch
set ignorecase
set softtabstop=4
set shiftwidth=4
autocmd FileType make setlocal noexpandtab
se nu rnu
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4
map <C-a> <esc>ggVG<CR>
map <F2> :w<CR><leader>r<CR>
map <C-s> :w<CR>
map <C-q> :q<CR>
map <C-o> :vsp ~/.vimrc<CR>
map <C-i> :vbash<CR>
"nmap <silent> <A-Up> :wincmd k<CR>
"nmap <silent> <A-Down> :wincmd j<CR>
"nmap <silent> <A-Left> :wincmd h<CR>
"nmap <silent> <A-Right> :wincmd l<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
noremap! <C-BS> <C-w>
cnoreabbrev install PluginInstall
cnoreabbrev bash ConqueTermSplit bash
cnoreabbrev vbash ConqueTermVSplit bash
cnoreabbrev list PluginList
cnoreabbrev euckr :e ++enc=euc-kr
nnoremap <silent> <C-p> :NERDTreeToggle<CR>
" custom color settings
syntax on
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi Comment guifg=#000000 ctermfg=Magenta
set t_Co=256
set cursorline
hi cursorline term=none cterm=none guibg=#303000 ctermbg=234
"set cursorcolumn

" srcexpl setting
" // The switch of the Source Explorer
nmap <F8> :SrcExplToggle<CR>
" // Set the height of Source Explorer window
let g:SrcExpl_winHeight = 8
" // Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100
" // Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"
" // Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"
" // In order to avoid conflicts, the Source Explorer should know what plugins except
" // itself are using buffers. And you need add their buffer names into below list
" // according to the command ":buffers!"
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_",
        \ "Source_Explorer"
    \ ]
" // The color schemes used by Source Explorer. There are five color schemes
" // supported for now - Red, Cyan, Green, Yellow and Magenta. Source Explorer
" // will pick up one of them randomly when initialization.
let g:SrcExpl_colorSchemeList = [
        \ "Red",
        \ "Cyan",
        \ "Green",
        \ "Yellow",
        \ "Magenta"
    \ ]
" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1
" // Workaround for Vim bug @https://goo.gl/TLPK4K as any plugins using autocmd for
" // BufReadPre might have conflicts with Source Explorer. e.g. YCM, Syntastic etc.
let g:SrcExpl_nestedAutoCmd = 1
" // Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0
" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" // create/update the tags file
"let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
" // Set "<F12>" key for updating the tags file artificially
let g:SrcExpl_updateTagsKey = "<F12>"
" // Set "<F3>" key for displaying the previous definition in the jump list
let g:SrcExpl_prevDefKey = "<F3>"
" // Set "<F4>" key for displaying the next definition in the jump list
let g:SrcExpl_nextDefKey = "<F4>"

" airline theme
let g:airline_theme='onehalfdark'

" indent line settings
let g:indentLine_color_term = 20
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_tty_light = 7 " (default: 4)

" NERDTree settings
let NERDTreeShowHidden=1

"nnoremap <silent> <C-[> :TlistToggle<CR>

" coderunner settings
"let g:vcr_languages["py"] = g:vcr_languages["python"]
"let g:vcr_languages["python"] = {
            "\"cmd": "/usr/bin/python3"
"            \}

" Syntax Checker recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
cabbrev <silent> bd <C-r>=(getcmdtype()==#':' && getcmdpos()==1 ? 'lclose\|bdelete' : 'bd')<CR>

" ---------------------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'pangloss/vim-javascript'
"Plugin 'mxw/vim-jsx'
"Plugin 'othree/javascript-libraries-syntax.vim'
"Plugin 'myhere/vim-nodejs-complete'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'yggdroot/indentline'
" code runner - usage:<leader>r
"Plugin '0x84/vim-coderunner'
" syntax checker
"Plugin 'vim-syntastic/syntastic'
"Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-surround'
"Plugin 'jeffkreeftmeijer/vim-numbertoggle'
"Plugin 'universal-ctags/ctags'
"Plugin 'soramugi/auto-ctags.vim'
"Plugin 'wesleyche/srcexpl'
"Plugin 'taglist.vim'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'miyakogi/conoline.vim'
call vundle#end()            " required
filetype plugin indent on    " required
