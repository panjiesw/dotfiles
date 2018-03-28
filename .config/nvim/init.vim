" ===========================================================================
" Vim-Plug Block {{{
" ===========================================================================
call plug#begin('~/.local/share/nvim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-vinegar'
Plug 'Shougo/deoplete.nvim'

call plug#end()

" }}}
" ===========================================================================
" Basic Settings {{{
" ===========================================================================
" colorscheme base16-google-dark

let mapleader = ' '
let maplocalleader = ' '

set nu
" set clipboard+=unnamedplus
set nohidden "vim-vinegar bug https://github.com/tpope/vim-vinegar/issues/13

" }}}
" ============================================================================
" MAPPINGS {{{
" ============================================================================

" ----------------------------------------------------------------------------
" Basic mappings
" ----------------------------------------------------------------------------

" Save
inoremap <C-s>     <C-O>:update<cr>
nnoremap <C-s>     :update<cr>
nnoremap <leader>s :update<cr>
nnoremap <leader>w :update<cr>

" Disable CTRL-A on tmux or on screen
if $TERM =~ 'screen'
  nnoremap <C-a> <nop>
  nnoremap <Leader><C-a> <C-a>
endif

" Quit
inoremap <C-Q>     <esc>:q<cr>
nnoremap <C-Q>     :q<cr>
vnoremap <C-Q>     <esc>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>Q :qa!<cr>

" jk | Escaping!
inoremap jk <Esc>
xnoremap jk <Esc>

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-^> <C-o><C-^>

" Copas
vnoremap <C-c> "*y
inoremap <C-v> <C-r><C-p>*

" Undo Redo
inoremap <C-z> <C-o>:u<CR>
inoremap <C-y> <C-o><C-R>

" ----------------------------------------------------------------------------
" Deoplete mappings
" ----------------------------------------------------------------------------
" Select next
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" Select prev
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" }}}
" ============================================================================
" Plugins {{{
" ============================================================================

" Airline Configuration
let g:airline_theme='base16_default'
let g:airline_powerline_fonts=1 " Force powerline?
let g:airline#extensions#tabline#enabled=1 " Show buffers

" Start deoplate
let g:deoplete#enable_at_startup=1

" }}}
" ===========================================================================
" Misc {{{
" ===========================================================================

" Scroll history to shad
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" vim-vinegar bug https://github.com/tpope/vim-vinegar/issues/13
augroup netrw_buf_hidden_fix
    autocmd!

    " Set all non-netrw buffers to bufhidden=hide
    autocmd BufWinEnter *
                \  if &ft != 'netrw'
                \|     set bufhidden=hide
                \| endif

augroup end

" }}}
