" Ensure vim-plug is installed and auto loaded
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif

" Enable plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Raimondi/delimitMate'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'brooth/far.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'Valloric/YouCompleteMe', { 'on': [] }
"Plug 'klen/python-mode'
"Plug 'xolox/vim-easytags'
"Plug 'bfredl/nvim-ipy'

" TODO: Defer loading based on extension
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'groenewege/vim-less'
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'ekalinin/Dockerfile.vim'

" Color schemes and icons
Plug 'joshdick/onedark.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ryanoasis/vim-devicons'
Plug 'icymind/NeoSolarized'

call plug#end()


" Defer plugin loading
augroup load_deferred_plugins
  autocmd!
  autocmd InsertEnter * call plug#load('YouCompleteMe')
                     \| autocmd! load_deferred_plugins
augroup END


source ~/.vimrc

set background=light
colorscheme onedark
"colorscheme PaperColor
"colorscheme NeoSolarized

" Doesn't need to make any difference anymore
"let g:airline_theme='onedark'
"let g:airline_theme='PaperColor'
"let g:airline_theme='solarized'
