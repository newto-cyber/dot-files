" ==============================================================================
" PLUGINS
" ==============================================================================
call plug#begin('~/.vim/plugged')

" Appearance & Themes
Plug 'joshdick/onedark.vim'              " Sleek, modern dark theme
Plug 'itchyny/lightline.vim'             " Clean, customizable status line (footer)

" Syntax Highlighting & Formatting
Plug 'sheerun/vim-polyglot'              " Better syntax highlighting for almost all languages

" File System Explorer
Plug 'preservim/nerdtree'                " Mini file explorer

call plug#end()

" ==============================================================================
" GENERAL SETTINGS
" ==============================================================================
set nocompatible            
syntax on                  
set number                  
set relativenumber                      

" Indentation Rules
set autoindent              
set smartindent            
set tabstop=4               
set shiftwidth=4            
set expandtab               

" Search and Navigation
set hlsearch                " Highlight search results
set incsearch               " Show search matches 
set ignorecase              " Ignore case in search patterns
set smartcase               " Override ignorecase if search contains uppercase

" ==============================================================================
" APPEARANCE
" ==============================================================================
" Enable true color support if available in terminal
if (has("termguicolors"))
  set termguicolors
endif

" Set the color scheme TODO: config
" colorscheme onedark

" ==============================================================================
" PLUGIN CONFIGURATIONS
" ==============================================================================

" --- NERDTree (File Explorer) ---
" Toggle the file explorer by pressing Ctrl+n
nnoremap <C-n> :NERDTreeToggle<CR>
" Start NERDTree automatically when Vim starts without a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" --- Lightline (Status Bar Footer) ---
" Hide the default mode text (e.g., -- INSERT --) since Lightline handles it
set noshowmode

" Track when Vim was started to calculate elapsed time
let g:startup_time = localtime()

" Function to calculate and format session elapsed time
function! SessionTime()
  let l:elapsed = localtime() - g:startup_time
  let l:h = l:elapsed / 3600
  let l:m = (l:elapsed % 3600) / 60
  let l:s = l:elapsed % 60
  if l:h > 0
    return printf('uptime: %02d:%02d:%02d', l:h, l:m, l:s)
  endif
  return printf('uptime: %02d:%02d', l:m, l:s)
endfunction

" Function to display current local time
function! CurrentTime()
  return strftime('%H:%M:%S')
endfunction

" Configure Lightline layout and inject custom time functions
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'currenttime', 'sessiontime' ] ]
      \ },
      \ 'component_function': {
      \   'currenttime': 'CurrentTime',
      \   'sessiontime': 'SessionTime'
      \ },
      \ }

" Ensure the status line is always visible
set laststatus=2



