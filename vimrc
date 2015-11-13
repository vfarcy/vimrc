set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tmhedberg/SimpylFold'

Plugin 'Valloric/YouCompleteMe'

Plugin 'vim-scripts/indentpython.vim'

Plugin 'scrooloose/syntastic'

Plugin 'nvie/vim-flake8'

Plugin 'jnurmine/Zenburn'

Plugin 'vfarcy/vim-colors-solarized'

Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'tpope/vim-fugitive'

Plugin 'kien/ctrlp.vim'

Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za


set encoding=utf-8

let python_highlight_all=1
syntax on

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

set nu

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.py set tabstop=4  softtabstop=4  shiftwidth=4  textwidth=79  expandtab  autoindent  fileformat=unix


au BufNewFile,BufRead *.js,*.html,*.css set tabstop=2  softtabstop=2  shiftwidth=2


let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

call togglebg#map("<F5>")



