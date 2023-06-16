let mapleader = " "
set timeoutlen=500

nmap <leader>gt :!tig --all<CR>
nmap <leader>gd :!TIGRC_USER="$HOME/.config/tig/.dotfiles" GIT_DIR="$HOME/.dotfiles" GIT_WORK_TREE="$HOME" tig --all<CR>
nmap <leader>gl :!lazygit<CR>
nmap <leader>so :source ~/.config/vim/vimrc<CR>
nmap <leader>cl :w<CR>:!latexmk -C; latexmk -shell-escape -pdf main.tex
map  <leader>h :noh<CR>
nmap <leader><leader> :!
nmap <leader>W :w !sudo tee %
nmap <leader>e :Ex<CR>

map  <leader>r :call ToggleLineNumber()<CR>
map  <leader>vd :call ToggleThemeMode('dark')<CR>

map  <leader>va :call ToggleThemeMode('')<CR>
nmap <leader>f :FZF<CR>
"nmap <leader>f :call fzf#run()<CR>

nmap <leader>ss :shell<CR>

nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz

nnoremap n nzz
nnoremap N Nzz

nnoremap Y y$

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><
