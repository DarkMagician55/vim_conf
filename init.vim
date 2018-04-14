call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
"Plug 'MattesGroeger/vim-bookmarks'
Plug 'Shougo/denite.nvim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-syntastic/syntastic'
"Plug 'mileszs/ack.vim'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
"Plug 'myusuf3/numbers.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh'  }
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'wakatime/vim-wakatime'

call plug#end()


" normal
let mapleader=","

syntax enable
set background=dark
colorscheme molokai
"set showcmd "显示输入命令
set tabstop=4 "设置tab键缩进
set cursorline
set number
set mousehide
scriptencoding utf-8
filetype plugin on
set fdm=marker

set ignorecase " 搜索忽略大小写

" python
let g:python3_host_prog = '/usr/local/bin/python3'

if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:ctrlp_show_hidden = 1

"bookmark
"let g:bookmark_highlight_lines = 1
"let g:bookmark_sign = '' 

"numbers
"let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']
"nnoremap <F3> :NumbersToggle<CR>

"fzf
nnoremap <silent> <Leader>f :Files<CR>
map <C-p> :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>a :Ag<CR>
nmap ma :Marks<CR>
nnoremap <silent> <Leader>l :BLines<CR>
let g:fzf_buffers_jump = 1
"let g:fzf_tags_command = 'ctags -R'

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.tmp/*,*/.sass-cache/*,*/node_modules/*,*.keep,*.DS_Store,*/.git/*
"nmap <Leader>b :CtrlPBuffer<CR>

"vim-easymotion
nmap f <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
" <Leader>f{char} to move to {char}
"map  <Leader>f <Plug>(easymotion-bd-f)
"nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}

" Move to line
"map <Leader>L <Plug>(easymotion-bd-jk)
"nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
"map  <Leader>w <Plug>(easymotion-bd-w)
"nmap <Leader>w <Plug>(easymotion-overwin-w)<Paste>


" PIV {
    if isdirectory(expand("~/.vim/bundle/PIV"))
        let g:DisableAutoPHPFolding = 0
        let g:PIVAutoClose = 0
    endif
" }

" Ctags {
    set tags=./tags;/,~/.vimtags

    " Make tags placed in .git/tags file available in all levels of a repository
    let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
    if gitroot != ''
        let &tags = &tags . ',' . gitroot . '/.git/tags'
    endif
" }


" NerdTree {
    if isdirectory(expand("~/.vim/plugged/nerdtree"))
        map <C-e> :NERDTreeToggle<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>
		autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
    endif
" }

" TagBar {
     if isdirectory(expand("~/.vim/plugged/tagbar/"))
         nnoremap <silent> <leader>t :TagbarToggle<CR>
     endif
"}


"NERD Commenter"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1



" cscope setting
"if has("cscope")
"  set csprg=/usr/local/bin/cscope
"  set csto=1
"  set cst
"  set nocsverb
"  " add any database in current directory
"  if filereadable("cscope.out")
"      cs add cscope.out
"  endif
"  set csverb
"endif
"
"ack
"cnoreabbrev Ack Ack!
"nnoremap <Leader>a :Ack!<Space>
""高亮搜索关键词
"let g:ackhighlight = 1
""修改快速预览窗口高度为15
"let g:ack_qhandler = "botright copen 15"
""在QuickFix窗口使用快捷键以后，自动关闭QuickFix窗口
"let g:ack_autoclose = 1
""使用ack的空白搜索，即不添加任何参数时对光标下的单词进行搜索，默认值为1，表示开启，置0以后使用空白搜索将返回错误信息
"let g:ack_use_cword_for_empty_search = 1
"let g:ack_apply_qmappings = 1
"let g:ack_apply_lmappings = 1
