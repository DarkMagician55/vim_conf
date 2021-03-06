" vundle 环境设置
"filetype off
syntax enable
syntax on


set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" :PluginInstall
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'


" 插件列表结束
call vundle#end()
filetype plugin indent on

" conf
" set t_Co=256
set background=dark
set number
colorscheme molokai

" NERDTree config
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
" autocmd vimenter * NERDTree " auto open NERDTree
