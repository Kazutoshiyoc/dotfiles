set nocompatible                 " vi互換モードの無効化

scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8

set noswapfile                    " スワップファイルは使わない

set number                        " 行番号を表示する
set cursorline                    " カーソルラインの表示
set ruler                         " カーソルが何行目の何列目に置かれているかを表示する
set title                         " ウインドウのタイトルバーにファイルのパス情報等を表示する
set showcmd                       " 入力中のコマンドを表示する

set showmatch                     " 対応する括弧やブレースを表示する
set list                          " 不可視文字を表示す
"set nowrap                        " 行を折り返さない
set scrolloff=5                   " スクロール時の行のマージン

set wildmenu                      " コマンドラインモードで<Tab>キーによるファイル名補完を有効にする

set smartcase                     " 小文字のみで検索したときに大文字小文字を無視する
set incsearch                     " 検索ワードの最初の文字を入力した時点で検索を開始する
set hlsearch                      " 検索結果をハイライト表示する
set wrapscan

set tabstop=4                     " タブ文字の表示幅
"set expandtab                     " タブ入力を複数の空白入力に置き換える
set listchars=tab:>\ ,extends:<   " タブと行の続きを可視化する

set shiftwidth=4                  " Vimが挿入するインデントの幅
set autoindent                    " 改行時に前の行のインデントを継続する
"set smartindent                  " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smarttab                      " 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする

set backspace=2                   " backspaceを有効にする
set visualbell t_vb=              " ビープ音/ビジュアルベルを無効化

set timeoutlen=500                " mapの入力の待ち時間

set diffopt=filler,context:10000  " difftoolでの表示行数の指定


" ==================================================================
" 入力補助
" ==================================================================

" 括弧補完
inoremap {} {}<Left>
inoremap { {}<Left>

inoremap {}<Enter> {};<Left><Left>
inoremap {<Enter> {<CR><Tab><End><CR><Backspace>}<Up><End>

inoremap (<Space> ()<Space><Left><Left>
inoremap () ()<Left>
inoremap ( ()<Left>

inoremap ()<Enter> ();<Left><Left>
inoremap (<Enter> ("\n");<Left><Left><Left><Left><Left>

inoremap [] []<Left>
inoremap [ []<Left>

" <S-tab>で予測候補入力
inoremap <S-tab> <C-n>

" <Insert>無効、iに置き換え
inoremap <Insert> <Esc>i

" Visual modeの開始（Windowsでの<C-v>(貼り付け)に対応）
nnoremap <A-v> <C-v>

" インデントの調整
vnoremap < <gv
vnoremap > >gv

" re-do
nnoremap r <C-r>

" カーソル下の単語検索の際にカーソル行を維持
nnoremap * *N

" vimdiffの変更行検索
if &diff
	nnoremap c ]c
	nnoremap <S-c> [c
endif

" <S-Home>で行頭にカーソル合わせ
inoremap <S-Home> <Esc>^<Insert>
nnoremap <S-Home> ^

" <C-Home><C-End>でタブの切り替え
nnoremap <C-Home> :tabNext<CR>
nnoremap <C-End> :tabnext<CR>

vnoremap <C-Home> <Esc>:tabNext<CR>
vnoremap <C-End> <Esc>:tabnext<CR>

inoremap <C-Home> <Esc>:tabNext<CR>
inoremap <C-End> <Esc>:tabnext<CR>

" <Shift>押しながらだと5倍スクロール<Control>押しながらだと20倍スクロール（<Up><Down>のみ）
nnoremap <S-Up> <Up><Up><Up><Up><Up>
inoremap <S-Up> <Up><Up><Up><Up><Up>
nnoremap <C-Up> <Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>
inoremap <C-Up> <Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>
nnoremap <S-Down> <Down><Down><Down><Down><Down>
inoremap <S-Down> <Down><Down><Down><Down><Down>
nnoremap <C-Down> <Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down>
inoremap <C-Down> <Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down>

" <PageUp><PageDown>で画面スクロール
nnoremap <PageUp> <C-Y>
inoremap <PageUp> <Esc><C-Y>i
nnoremap <PageDown> <C-E>
inoremap <PageDown> <Esc><C-E>i


" ==================================================================
" Fnキーショートカットの設定
" ==================================================================
" ハイライトOFF
nnoremap <F1> :noh<CR>:set mouse=a<CR>:echomsg ""<CR>

" カーソル行ハイライトのON/OFF
nnoremap <F2> :set cursorline!<CR>:echomsg ""<CR>
inoremap <F2> <Esc>:set cursorline!<CR>:echomsg ""<CR>i

" カーソル列ハイライトのON/OFF
nnoremap <F3> :set cursorcolumn!<CR>:echomsg ""<CR>
inoremap <F3> <Esc>:set cursorcolumn!<CR>:echomsg ""<CR>i

" 置換ショートカットの設定
nnoremap <F4> :%s///gc<Left><Left><Left><Left><C-r><C-w><Right>
vnoremap <F4> :s///gc<Left><Left><Left><Left>

" ~/.vimrcの明示的な読み込み
nnoremap <C-F5> :source ~/.vimrc<CR>:noh<CR>:echomsg "reloaded .vimrc"<CR>

" git difftoolにvimdiffを設定している場合に差分情報を表示/終了
nnoremap <F6> :!git difftool %:p<CR><CR>
if &diff
	nnoremap <F6> :qa<CR>
	nnoremap :q :qa<CR>
endif

" カラーテーマ／コントラストの切替
nnoremap <F8> :call ToggleContrast(g:contrast_mode)<CR>
inoremap <F8> <Esc>:call ToggleContrast(g:contrast_mode)<CR><Right>i
nnoremap <S-F8> :call ToggleHighlight(g:mode)<CR>
inoremap <S-F8> <Esc>:call ToggleHighlight(g:mode)<CR><Right>i

" 新規タブ
nnoremap <F12> :tabnew 
nnoremap <C-F12> :tabnew<CR>:Explore<CR>:echomsg "Please push the \<Enter\> on the file you want to open."<CR>


" ==================================================================
" シンタックスの設定
" ==================================================================
" 動作モード
let g:mode = "dark"

" 色の定義
let s:white255 = { "cterm": "255", "gui": "#eeeeee"}
let s:white254 = { "cterm": "254", "gui": "#e4e4e4"}
let s:white253 = { "cterm": "253", "gui": "#dadada"}
let s:white252 = { "cterm": "252", "gui": "#d0d0d0"}
let s:white251 = { "cterm": "251", "gui": "#c6c6c6"}
let s:white = { "cterm": "250", "gui": "#d7d7d7"}
let s:black = { "cterm": "235", "gui": "#262626"}
let s:black2 = { "cterm": "234", "gui": "#1c1c1c"}
let s:boldBlack = { "cterm": "16", "gui": "#000000"}

let s:gray  = { "cterm": "237", "gui": "#3a3a3a"}
let s:gray2 = { "cterm": "238", "gui": "#444444"}
let s:gray3 = { "cterm": "239", "gui": "#4e4e4e"}
let s:gray4 = { "cterm": "240", "gui": "#585858"}
let s:gray5 = { "cterm": "241", "gui": "#606060"}
let s:gray6 = { "cterm": "242", "gui": "#666666"}
let s:gray7 = { "cterm": "243", "gui": "#767676"}
let s:gray8 = { "cterm": "244", "gui": "#808080"}
let s:gray9 = { "cterm": "245", "gui": "#8a8a8a"}
let s:lightGray  = { "cterm": "246", "gui": "#949494"}
let s:lightGray2 = { "cterm": "247", "gui": "#9e9e9e"}
let s:lightGray3 = { "cterm": "248", "gui": "#a8a8a8"}
let s:lightGray4 = { "cterm": "249", "gui": "#b2b2b2"}

let s:blue        = { "cterm": "32", "gui": "#0087d7"}
let s:darkBlue    = { "cterm": "19", "gui": "#0000af"}
let s:lightBlue   = { "cterm": "67", "gui": "#5f87af"}
let s:diluteBlue  = { "cterm": "24", "gui": "#0087d7"}
let s:diluteBlue2 = { "cterm": "25", "gui": "#005faf"}
let s:blueGreen   = { "cterm": "37", "gui": "#00afaf"}

let s:darkCyan  = { "cterm": "73", "gui": "#5fafaf"}
let s:lightCyan = { "cterm": "123", "gui": "#87ffff"}

let s:green       = { "cterm": "35", "gui": "#00af5f"}
let s:darkGreen   = { "cterm": "22", "gui": "#005f00"}
let s:lightGreen  = { "cterm": "157", "gui": "#afffaf"}
let s:lightGreen2 = { "cterm": "121", "gui": "#87ffaf"}
let s:leafGreen   = { "cterm": "34", "gui": "#00af00"}

let s:purple       = { "cterm": "135", "gui": "#af5fff"}
let s:darkPurple   = { "cterm": "54", "gui": "#5f0087"}
let s:lightPurple  = { "cterm": "104", "gui": "#8787d7"}
let s:dilutePurple = { "cterm": "60", "gui": "#0087d7"}
let s:redPurple    = { "cterm": "141", "gui": "#af87ff"}
let s:bluePurple   = { "cterm": "104", "gui": "#8787d7"}
let s:bluePurple2  = { "cterm": "57", "gui": "#5f00ff"}

let s:lightPink = { "cterm": "225", "gui": "#ffd7ff"}

let s:magenta      = { "cterm": "125", "gui": "#af005f"}
let s:lightMagenta = { "cterm": "201", "gui": "#ff00ff"}

let s:red     = { "cterm": "160", "gui": "#d70000"}
let s:darkRed = { "cterm": "95", "gui": "#875f5f"}

let s:vermilion      = { "cterm": "203", "gui": "#ff5f5f"}
let s:lightVermilion = { "cterm": "217", "gui": "#ffafaf"}

let s:orange       = { "cterm": "130", "gui": "#af5f00"}
let s:diluteOrange = { "cterm": "94", "gui": "#af5f00"}

" ---------------------------------
" シンタックス設定関数
" ---------------------------------
function! s:setHighlight(group, fg, bg, attribute)
	" a:fgが辞書型の場合
	if type(a:fg) == type({})
		execute "highlight " . a:group
			\. " ctermfg=" . a:fg.cterm . " guifg="   . a:fg.gui
			\. " "         . a:attribute
	" a:fgが辞書型以外の場合
	else
		execute "highlight " . a:group
			\. " ctermfg=NONE guifg=NONE"
			\. " "         . a:attribute
	endif
	" a:bgが辞書型の場合
	if type(a:bg) == type({})
		execute "highlight " . a:group
			\. " ctermbg=" . a:bg.cterm . " guibg=" . a:bg.gui
			\. " "         . a:attribute
	" a:bgが辞書型以外の場合
	else
		execute "highlight " . a:group
			\. " ctermbg=NONE guibg=NONE"
			\. " "         . a:attribute
	endif
endfunction

" ---------------------------------
" シンタックス設定関数
" ---------------------------------
function! InitHighlight(mode)

	let g:contrast_mode = "low"

	" ダークモード
	if a:mode == "dark"
		call SetDefaultDark()
	endif

	" ライトモード
	if a:mode == "light"
		call SetDefaultLight()
	endif

endfunction
" --------------------------
function! ToggleHighlight(mode)

	" ダークモード -> ライトモード
	if a:mode == "dark"
		let g:mode = "light"
		call InitHighlight(g:mode)
	endif

	" ライトモード -> ダークモード
	if a:mode == "light"
		let g:mode = "dark"
		call InitHighlight(g:mode)
	endif

endfunction
" --------------------------
function! SetHighContrast(mode)

	" ダークモード
	if a:mode == "dark"
		call SetHighContrastDark()
	endif

	" ライトモード
	if a:mode == "light"
		call SetHighContrastLight()
	endif

endfunction
" --------------------------
function! ToggleContrast(contrast_mode)

	" high -> low
	if a:contrast_mode == "high"
		let g:contrast_mode = "low"
		call InitHighlight(g:mode)
	endif

	" low -> high
	if a:contrast_mode == "low"
		let g:contrast_mode = "high"
		call SetHighContrast(g:mode)
	endif

endfunction

" ---------------------------------
" カラースキーム
" ---------------------------------
function! SetDefaultDark()

	let g:mode = "dark"

	" デフォルトカラーの定義
	let s:fg    = s:white
	let s:bg    = s:black
	let s:cursorBg = s:gray

	" カラーテーマの設定
	set background=dark
	highlight clear
	syntax reset

	" 行番号
	call s:setHighlight("LineNr", s:gray4, s:bg, "cterm=bold")
	call s:setHighlight("CursorLineNr", s:orange, s:bg, "cterm=bold")

	" カーソル行／列
	call s:setHighlight("CursorLine",   "", s:cursorBg, "cterm=bold")
	call s:setHighlight("CursorColumn", "", s:cursorBg, "cterm=bold")

	" 文字
	call s:setHighlight("Normal", s:fg, s:bg, "")
	call s:setHighlight("Visual", "", s:gray, "cterm=bold")

	" 文字列
	call s:setHighlight("Comment", s:gray7, s:bg, "")
	call s:setHighlight("String",  s:blue, s:bg, "")

	" 記号／特殊文字
	call s:setHighlight("SpecialKey", s:gray2, s:bg, "")
	call s:setHighlight("SpecialChar", s:blueGreen, s:bg, "")

	" プリプロセッサ命令
	call s:setHighlight("PreProc", s:dilutePurple, s:bg, "")
	call s:setHighlight("Include", s:purple, s:bg, "")
	call s:setHighlight("Macro",   s:purple, s:bg, "")
	call s:setHighlight("PreCondit", s:bluePurple, s:bg, "")

	" if, for, while, do
	call s:setHighlight("Conditional", s:redPurple, s:bg, "")
	call s:setHighlight("Repeat", s:redPurple, s:bg, "")

	" 型
	call s:setHighlight("Type", s:green, s:bg, "")

	" 定数
	call s:setHighlight("Constant", s:magenta, s:bg, "")
	call s:setHighlight("Number", s:vermilion, s:bg, "")

	" シェルスクリプト
	call s:setHighlight("shShellVariables", s:blueGreen, s:bg, "")
	call s:setHighlight("shSetList", s:green, s:bg, "")

	" Pmenu
	call s:setHighlight("Pmenu", s:boldBlack, s:gray3, "")
	call s:setHighlight("PmenuSel", s:boldBlack, s:lightGreen2, "")

	" 検索
	call s:setHighlight("Search", s:fg, s:diluteBlue2, "term=reverse")

	" Vim statusline
	call s:setHighlight("ErrorMsg", s:white255, s:red, "term=standout")
	call s:setHighlight("MoreMsg", s:leafGreen, s:bg, "term=bold")
	call s:setHighlight("Question", s:leafGreen, s:bg, "term=standout")

	" vimdiff
	call s:setHighlight("DiffAdd", s:lightGreen, s:darkGreen, "")
	call s:setHighlight("DiffDelete", s:lightPink, s:darkRed, "")
	call s:setHighlight("DiffChange", s:boldBlack, s:darkCyan, "")
	call s:setHighlight("DiffText", s:lightMagenta, s:lightCyan, "cterm=bold")

	" netrw
	call s:setHighlight("netrwDir", s:blue, s:bg, "cterm=bold")
	call s:setHighlight("netrwExe", s:green, s:bg, "cterm=bold")
	call s:setHighlight("netrwClassify", s:blueGreen, s:bg, "cterm=bold")

endfunction

" --------------------------
function! SetDefaultLight()

	let g:mode = "light"

	" デフォルトカラーの定義
	let s:fg    = s:boldBlack
	let s:bg    = s:white253
	let s:cursorBg = s:white252

	" カラーテーマの設定
	set background=light
	highlight clear
	syntax reset

	" 行番号
	call s:setHighlight("LineNr", s:darkRed, s:bg, "")
	call s:setHighlight("CursorLineNr", s:orange, s:bg, "cterm=bold")

	" カーソル行／列
	call s:setHighlight("CursorLine",   "", s:cursorBg, "cterm=bold")
	call s:setHighlight("CursorColumn", "", s:cursorBg, "cterm=bold")

	" 文字
	call s:setHighlight("Normal", s:fg, s:bg, "")
	call s:setHighlight("Visual", "", s:white251, "")

	" 文字列
	call s:setHighlight("Comment", s:lightBlue, s:bg, "")
	call s:setHighlight("String",  s:darkBlue, s:bg, "")

	" 記号／特殊文字
	call s:setHighlight("SpecialKey", s:white251, s:bg, "")
	call s:setHighlight("SpecialChar", s:diluteBlue2, s:bg, "")

	" プリプロセッサ命令
	call s:setHighlight("Include", s:darkPurple, s:bg, "")
	call s:setHighlight("Macro",   s:darkPurple, s:bg, "")
	call s:setHighlight("PreCondit", s:lightPurple, s:bg, "")

	" if, for, while, do
	call s:setHighlight("Conditional", s:bluePurple2, s:bg, "")
	call s:setHighlight("Repeat", s:bluePurple2, s:bg, "")

	" 型
	call s:setHighlight("Type", s:leafGreen, s:bg, "")

	" 定数
	call s:setHighlight("Constant", s:magenta, s:bg, "")
	call s:setHighlight("Number", s:red, s:bg, "")

	" シェルスクリプト
	call s:setHighlight("shShellVariables", s:blueGreen, s:bg, "")
	call s:setHighlight("shSetList", s:blue, s:bg, "")

	" vimdiff
	call s:setHighlight("DiffAdd", "", s:lightGreen2, "")
	call s:setHighlight("DiffDelete", "", s:lightVermilion, "")
	call s:setHighlight("DiffChange", "", s:lightCyan, "")
	call s:setHighlight("DiffText", s:lightMagenta, s:lightCyan, "cterm=bold")

	" netrw
	call s:setHighlight("netrwDir", s:darkBlue, s:bg, "cterm=bold")
	call s:setHighlight("netrwExe", s:leafGreen, s:bg, "cterm=bold")
	call s:setHighlight("netrwClassify", s:blueGreen, s:bg, "cterm=bold")

endfunction

" ---------------------------------
" ハイコントラストテーマ
" ---------------------------------
function! SetHighContrastDark()

	" デフォルトカラーの定義
	let s:fg    = s:white
	let s:bg    = s:black2
	let s:cursorBg = s:gray

	" カラーテーマの設定
	set background=dark
	highlight clear
	syntax reset

	" 行番号
	call s:setHighlight("LineNr", s:gray4, s:bg, "cterm=bold")
	call s:setHighlight("CursorLineNr", s:orange, s:bg, "cterm=bold")

	" カーソル行／列
	call s:setHighlight("CursorLine",   "", s:cursorBg, "cterm=bold")
	call s:setHighlight("CursorColumn", "", s:cursorBg, "cterm=bold")

	" 文字
	call s:setHighlight("Normal", s:fg, s:bg, "cterm=bold")
	call s:setHighlight("Visual", "", s:gray, "cterm=bold")

	" 文字列
	call s:setHighlight("Comment", s:gray7, s:bg, "")
	call s:setHighlight("String",  s:blue, s:bg, "")

	" 記号／特殊文字
	call s:setHighlight("SpecialKey", s:gray2, s:bg, "")
	call s:setHighlight("SpecialChar", s:blueGreen, s:bg, "")

	" プリプロセッサ命令
	call s:setHighlight("PreProc", s:dilutePurple, s:bg, "")
	call s:setHighlight("Include", s:purple, s:bg, "")
	call s:setHighlight("Macro",   s:purple, s:bg, "")
	call s:setHighlight("PreCondit", s:bluePurple, s:bg, "")

	" if, for, while, do
	call s:setHighlight("Conditional", s:redPurple, s:bg, "")
	call s:setHighlight("Repeat", s:redPurple, s:bg, "")

	" 型
	call s:setHighlight("Type", s:green, s:bg, "")

	" 定数
	call s:setHighlight("Constant", s:magenta, s:bg, "")
	call s:setHighlight("Number", s:vermilion, s:bg, "")

	" シェルスクリプト
	call s:setHighlight("shShellVariables", s:blueGreen, s:bg, "")
	call s:setHighlight("shSetList", s:green, s:bg, "")

	" Pmenu
	call s:setHighlight("Pmenu", s:boldBlack, s:gray3, "")
	call s:setHighlight("PmenuSel", s:boldBlack, s:lightGreen2, "")

	" 検索
	call s:setHighlight("Search", s:fg, s:diluteBlue2, "term=reverse")

	" Vim statusline
	call s:setHighlight("ErrorMsg", s:white255, s:red, "term=standout")
	call s:setHighlight("MoreMsg", s:leafGreen, s:bg, "term=bold")
	call s:setHighlight("Question", s:leafGreen, s:bg, "term=standout")

	" vimdiff
	call s:setHighlight("DiffAdd", s:lightGreen, s:darkGreen, "")
	call s:setHighlight("DiffDelete", s:lightPink, s:darkRed, "")
	call s:setHighlight("DiffChange", s:boldBlack, s:darkCyan, "")
	call s:setHighlight("DiffText", s:lightMagenta, s:lightCyan, "cterm=bold")

	" netrw
	call s:setHighlight("netrwDir", s:blue, s:bg, "cterm=bold")
	call s:setHighlight("netrwExe", s:green, s:bg, "cterm=bold")
	call s:setHighlight("netrwClassify", s:blueGreen, s:bg, "cterm=bold")

endfunction

" --------------------------
function! SetHighContrastLight()

	" デフォルトカラーの定義
	let s:fg    = s:boldBlack
	let s:bg    = s:white255
	let s:cursorBg = s:white254

	" カラーテーマの設定
	set background=light
	highlight clear
	syntax reset

	" 行番号
	call s:setHighlight("LineNr", s:darkRed, s:bg, "")
	call s:setHighlight("CursorLineNr", s:orange, s:bg, "cterm=bold")

	" カーソル行／列
	call s:setHighlight("CursorLine",   "", s:cursorBg, "cterm=bold")
	call s:setHighlight("CursorColumn", "", s:cursorBg, "cterm=bold")

	" 文字
	call s:setHighlight("Normal", s:fg, s:bg, "")
	call s:setHighlight("Visual", "", s:white251, "")

	" 文字列
	call s:setHighlight("Comment", s:lightBlue, s:bg, "")
	call s:setHighlight("String",  s:darkBlue, s:bg, "")

	" 記号／特殊文字
	call s:setHighlight("SpecialKey", s:white252, s:bg, "")
	call s:setHighlight("SpecialChar", s:diluteBlue2, s:bg, "")

	" プリプロセッサ命令
	call s:setHighlight("Include", s:darkPurple, s:bg, "")
	call s:setHighlight("Macro",   s:darkPurple, s:bg, "")
	call s:setHighlight("PreCondit", s:lightPurple, s:bg, "")

	" if, for, while, do
	call s:setHighlight("Conditional", s:bluePurple2, s:bg, "")
	call s:setHighlight("Repeat", s:bluePurple2, s:bg, "")

	" 型
	call s:setHighlight("Type", s:leafGreen, s:bg, "")

	" 定数
	call s:setHighlight("Constant", s:magenta, s:bg, "")
	call s:setHighlight("Number", s:red, s:bg, "")

	" シェルスクリプト
	call s:setHighlight("shShellVariables", s:blueGreen, s:bg, "")
	call s:setHighlight("shSetList", s:blue, s:bg, "")

	" vimdiff
	call s:setHighlight("DiffAdd", "", s:lightGreen2, "")
	call s:setHighlight("DiffDelete", "", s:lightVermilion, "")
	call s:setHighlight("DiffChange", "", s:lightCyan, "")
	call s:setHighlight("DiffText", s:lightMagenta, s:lightCyan, "cterm=bold")

	" netrw
	call s:setHighlight("netrwDir", s:darkBlue, s:bg, "cterm=bold")
	call s:setHighlight("netrwExe", s:leafGreen, s:bg, "cterm=bold")
	call s:setHighlight("netrwClassify", s:blueGreen, s:bg, "cterm=bold")

endfunction

" ---------------------------------
" 初期化処理
" ---------------------------------
call InitHighlight(g:mode)


" ==================================================================
" ヤンクした文字列をクリップボードと連携
" ==================================================================
if has('win32') || has('win64') || has('mac')
  set clipboard=unnamed           " Windows, Macの場合はプライマリ("*)と共有
else
  set clipboard=unnamedplus       " Linuxの場合はクリップボード（"+）と共有
endif


" ==================================================================
" マウスの動作設定
" ==================================================================
set mouse=a
nnoremap <ScrollWheelUp> <Up><Up><Up>
inoremap <ScrollWheelUp> <Up><Up><Up>
nnoremap <ScrollWheelDown> <Down><Down><Down>
inoremap <ScrollWheelDown> <Down><Down><Down>

" 左クリックで対象ワードを検索
nnoremap <LeftMouse> <Esc>
nnoremap <2-LeftMouse> <S-LeftMouse>N<Esc>
nnoremap <3-LeftMouse> <S-LeftMouse>N<Esc>
nnoremap <4-LeftMouse> <S-LeftMouse>N<Esc>

" 右クリックは動作が変になるので無効化
nnoremap <RightMouse> <Esc>
nnoremap <2-RightMouse> <Esc>
nnoremap <3-RightMouse> <Esc>
nnoremap <4-RightMouse> <Esc>

vnoremap <RightMouse> <Esc>
vnoremap <2-RightMouse> <Esc>
vnoremap <3-RightMouse> <Esc>
vnoremap <4-RightMouse> <Esc>

inoremap <RightMouse> <Esc>
inoremap <2-RightMouse> <Esc>
inoremap <3-RightMouse> <Esc>
inoremap <4-RightMouse> <Esc>
