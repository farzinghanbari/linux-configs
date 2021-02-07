set nocompatible					" We want the latest Vim settings/options.

so ~/.vim/plugins.vim

syntax enable

set backspace=indent,eol,start				" Make backspace behave like every other editor.
let mapleader = ','					" The default leader is \, but a comma is much better.
set number						" Let's activate the line numbers.
" set autowriteall					" Automatically write the file when switching the buffers.
let g:snipMate = { 'snippet_version' : 1 }
set complete=.,w,b,u



"-----------Search-----------"
set hlsearch
set incsearch





"-----------Split Management-----------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>





"----------Visuals-----------"
colorscheme atom-dark-256 
set t_CO=256

" Remove scroll bars
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

set showtabline=2 					" Always display tabline.

" We'll fake a custom left padding for each window
set foldcolumn=1
hi foldcolumn ctermbg=bg




"-----------Mappings-----------"
" Make it easy to edit the Vimrc file.
nmap <leader>ev :tabedit $MYVIMRC<cr>

" Add simple highlight removal.
nmap <leader><space> :nohlsearch<cr>

" Make NERDTree easier to use.
"nmap <C-V> :NERDTreeToggle<cr>

nmap <C-I> :CtrlPBufTag<cr>
nmap <C-E> :CtrlPMRUFiles<cr>





"-----------Plugins-----------"

"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'



"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0


"/
"/ Greplace.vim 
"/
set grepprg=ag							" We want to use Ag for the search.

let g:grep_cmd_opts = '--line-numbers --noheading'





"-----------Auto-Commands-----------"
" Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

" Expands the name under the cursor to its fully qualified name.
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>n :call PhpExpandClass()<CR>

"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>




" Notes and tips
" - Press "zz" to instantly center the line where the cursor is located.
