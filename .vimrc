syntax on

"************************
" Airline

let g:airline_powerline_fonts=1
let g:airline_theme='badwolf'

let Tlist_GainFocus_On_ToggleOpen = 0
let Tlist_Auto_Open = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:size=8,KanjiStrokeOrders
set backupdir=/mnt/CACHE/.vimcache/backup

set number
set laststatus=2
set mouse=a

set tabstop=2
set shiftwidth=2
set expandtab

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set background=dark

colorscheme solarized

syntax enable

autocmd FileType html setlocal sw=2 ts=2
autocmd FileType python setlocal sw=4 ts=4
autocmd FileType make setlocal noexpandtab
"autocmd vimenter * MBEOpen

map <C-n> :TlistToggle<CR>
map <C-l> :set background=light<CR>
map <C-d> :set background=dark<CR>
