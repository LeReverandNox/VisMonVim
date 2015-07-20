"*** On surligne la ligne actuelle
set cursorline
" hi CursorLine term=bold cterm=bold

"*** On surligne les résultats de la recherche
set hlsearch

"*** On modifie les regles d'indentation
set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=4
set shiftround
set smarttab

"*** On insere automatiquement un début de commentaire à la ligne suivante, lors d'un commentaire...
set formatoptions+=r

"*** On active la souris
set mouse=a

"*** On affiche les coordonnées du curseur dans la status line
set ruler

"*** On affiche la commande en cours dans la status line
set showcmd

"*** On active la recherche incrémentale durant la saisie
set incsearch

"*** On active l'historique pour 100 commandes
set history=100

"*** On recopie l'identation de la ligne en cours lors d'une nouvelle ligne
set autoindent

"*** On active l'indentation auto par type de fichier
filetype plugin indent on

"*** On active l'indentation intelligente pour le code
set smartindent

"*** On ignore la case lors de la recherche d'un pattern en minuscule
set smartcase

"*** On numérote les lignes
set number

"*** On active la création d'un backup et d'unm swap
set nobackup
"set backup
"set writebackup
set swapfile

"*** On affiche la status line en permanence
set laststatus=2

"*** On indique à Vim la couleur du background
set background=dark

"*** On active la coloration syntaxique
syntax on

"*** On définit le colorscheme
colorscheme badwolf

"*** On colore la 81eme colonne si on la depasse
hi ColorColumn ctermbg=39
call matchadd('ColorColumn', '\%81v', 100)

"*** On définit une largeur max de 80 pour les fichiers text
"autocmd FileType text setlocal textwidth=80

"=====[ Highlight matches when jumping to next ]=============
nnoremap <silent> n n:call HLNext(0.4)<cr>
nnoremap <silent> N N:call HLNext(0.4)<cr>

"=====[ Highlight the match in red ]=============
highlight WhiteOnPurple ctermbg=93 ctermfg=white
function! HLNext (blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#'.@/
    let ring = matchadd('WhiteOnPurple', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction

"*** On affiche les trailing spaces, les tabs et les non-breaking spaces
exec "set listchars=tab:>-,trail:\uB7,nbsp:~"
set list
"*** Et on les colore en bleu
hi SpecialKey ctermfg=39
hi NonText ctermfg=39

"*** On remap : sur ;
nnoremap ; :

"*** On active le mode diagraph quand on appuie sur C-K
inoremap <expr> <C-K> ShowDigraphs()
function! ShowDigraphs ()
    digraphs
    call getchar()
    return "\<C-K>"
endfunction

"*** On active l'UTF-8
set encoding=utf-8
