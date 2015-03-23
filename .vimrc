syntax on

"************************
" Airline

let g:airline_powerline_fonts=1
let g:airline_theme='badwolf'
set number
set laststatus=2

set tabstop=2
set shiftwidth=2
autocmd FileType html setlocal sw=2 ts=2
autocmd FileType python setlocal sw=4 ts=4
set expandtab
set backupdir=/mnt/CACHE/.vimcache/backup
set guifont=xbmicons,DejaVu\ Sans\ Mono\ for\ Powerline:size=8,KanjiStrokeOrders

syntax enable
set background=dark
colorscheme solarized

autocmd vimenter * MBEOpen
autocmd vimenter * TlistOpen

map <C-n> :NERDTreeToggle<CR>

let g:project_use_nerdtree = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_python_exec = '/usr/bin/python2'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

