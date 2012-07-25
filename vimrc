set nocompatible  " Use Vim settings, rather then Vi settings
set history=1000
set incsearch     " do incremental searching
set hlsearch      " highlight search
set laststatus=2  " Always display the status line
set noswapfile
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set fileencodings=utf-8
set backspace=2   " backspace over everything
set wildmenu
set ignorecase
set smartcase
set showmatch    " blink matching pairs {[(

"set autochdir
" Don't use Ex mode, use Q for formatting
map Q gq

" Change leader
let mapleader=","

" Map <leader>e to open files in the same directory as the current file
nnoremap <leader>e :FufCoverageFile<CR>

" Lazy movement
noremap <leader>j 15j
noremap <leader>k 15k

" F3 to select word, F4 to search, F4 to next, F5 to clear
nnoremap <F3> viw
vnoremap <F4> y/<C-R>"<CR>
nnoremap <F4> n
nnoremap <F5> :nohlsearch<CR>

" cd into current file dir
nnoremap ,cd :lcd %:p:h<CR>:pwd<CR>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  let &t_Co=256
endif

call pathogen#infect()
filetype plugin indent on

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list listchars=tab:>-,trail:-

" Numbers
set number
set numberwidth=5

" Pretty status line
set statusline=%<%f\ %y[%n]%=\ %(%1*%m%r%h%)%*\ L%l,C%c\ %P

" Tab completion options
set wildmode=list:longest,list:full
set complete=.,w,t

" Autocomplete using <C-x><C-u> (INSERT)
set completefunc=syntaxcomplete#Complete

" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
    let col = col('.') - 1

    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Tags
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Move using Ctrl + (hjkl)
nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Improve syntax highlighting
au BufRead,BufNewFile Gemfile set filetype=ruby
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.mon set filetype=epl
au BufRead,BufNewFile *.evt set filetype=epl
au BufRead,BufNewFile *.bdf set filetype=epl

" Some colors
colorscheme vividchalk
hi User1 ctermbg=Red ctermfg=Yellow gui=bold guibg=Red guifg=Yellow
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Default folder
au VimEnter * :cd ~

" Windows options
if has('win32')
  source $VIMRUNTIME\mswin.vim
end
