set nocompatible                 " vi互換モードの無効化

scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8

set noswapfile                    " スワップファイルは使わない

set number                        " 行番号を表示する
set cursorline                    " カーソルラインの表示
set laststatus=2                  " ステータスラインの表示
set showtabline=2                 " タブラインの表示
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
	nnoremap c ]c]ck
	nnoremap <S-c> [ck
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

" ハイライトグループの確認
nnoremap <F7> :echo synIDattr(synID(line("."), col("."), 1), "name")<CR>

" カラーテーマ／コントラストの切替
nnoremap <F8> :source ~/.vimrc<CR>:noh<CR>:echomsg ""<CR>
inoremap <F8> <Esc>:source ~/.vimrc<CR>:noh<CR>:echomsg ""<CR>i
nnoremap <S-F8> :call ToggleContrast(g:contrast_mode)<CR>
inoremap <S-F8> <Esc>:call ToggleContrast(g:contrast_mode)<CR><Right>i
nnoremap <C-F8> :call ToggleHighlight(g:mode)<CR>
inoremap <C-F8> <Esc>:call ToggleHighlight(g:mode)<CR><Right>i

" Terminal
set termwinsize=10x0
nnoremap <C-F9> :bo terminal<CR>
inoremap <C-F9> <Esc>:bo terminal<CR>
tnoremap <C-F9> exit<CR>
nnoremap <F9> <C-w>w
tnoremap <F9> <C-w>w
tnoremap <C-v> <C-w>N

" 新規タブ
nnoremap <F12> :tabnew 
nnoremap <C-F12> :tabnew<CR>:Explore<CR>:echomsg "Please push the \<Enter\> on the file you want to open."<CR>



" ==================================================================
" 色の定義
" ==================================================================
" 白/黒
let s:white255 = { "cterm": "255", "gui": "#eeeeee"}
let s:white254 = { "cterm": "254", "gui": "#e4e4e4"}
let s:white253 = { "cterm": "253", "gui": "#dadada"}
let s:white252 = { "cterm": "252", "gui": "#d0d0d0"}
let s:white251 = { "cterm": "251", "gui": "#c6c6c6"}
let s:white = { "cterm": "250", "gui": "#d7d7d7"}
let s:black = { "cterm": "235", "gui": "#262626"}
let s:black2 = { "cterm": "234", "gui": "#1c1c1c"}
let s:boldBlack = { "cterm": "16", "gui": "#000000"}
" 灰
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
" 青
let s:blue        = { "cterm": "32", "gui": "#0087d7"}
let s:darkBlue    = { "cterm": "19", "gui": "#0000af"}
let s:lightBlue   = { "cterm": "67", "gui": "#5f87af"}
let s:diluteBlue  = { "cterm": "24", "gui": "#0087d7"}
let s:diluteBlue2 = { "cterm": "25", "gui": "#005faf"}
let s:blueGreen   = { "cterm": "37", "gui": "#00afaf"}
let s:darkCyan   = { "cterm": "73", "gui": "#5fafaf"}
let s:darkCyan2  = { "cterm": "66", "gui": "#5f8787"}
let s:lightCyan  = { "cterm": "123", "gui": "#87ffff"}
let s:lightCyan2 = { "cterm": "152", "gui": "#afd7d7"}
" 緑
let s:green       = { "cterm": "35", "gui": "#00af5f"}
let s:darkGreen   = { "cterm": "22", "gui": "#005f00"}
let s:lightGreen  = { "cterm": "157", "gui": "#afffaf"}
let s:lightGreen2 = { "cterm": "121", "gui": "#87ffaf"}
let s:leafGreen   = { "cterm": "34", "gui": "#00af00"}
" 紫
let s:purple       = { "cterm": "135", "gui": "#af5fff"}
let s:darkPurple   = { "cterm": "54", "gui": "#5f0087"}
let s:lightPurple  = { "cterm": "104", "gui": "#8787d7"}
let s:dilutePurple = { "cterm": "60", "gui": "#0087d7"}
let s:redPurple    = { "cterm": "141", "gui": "#af87ff"}
let s:bluePurple   = { "cterm": "104", "gui": "#8787d7"}
let s:bluePurple2  = { "cterm": "57", "gui": "#5f00ff"}
let s:lightPink = { "cterm": "225", "gui": "#ffd7ff"}
" 赤
let s:red     = { "cterm": "160", "gui": "#d70000"}
let s:darkRed = { "cterm": "95", "gui": "#875f5f"}
let s:magenta      = { "cterm": "125", "gui": "#af005f"}
let s:lightMagenta = { "cterm": "201", "gui": "#ff00ff"}
let s:vermilion      = { "cterm": "203", "gui": "#ff5f5f"}
let s:lightVermilion = { "cterm": "217", "gui": "#ffafaf"}
" 黄
let s:yellow      = {"cterm":"11", "gui":"#ffff00"}
let s:orange       = { "cterm": "130", "gui": "#af5f00"}
let s:orange2      = { "cterm": "172", "gui": "#d75f00"}
let s:diluteOrange = { "cterm": "94", "gui": "#af5f00"}


" ==================================================================
" ステータスラインの設定
" ==================================================================
" 改行コード
let ff_table = {'dos' : 'DOS:CR+LF', 'unix' : 'UNIX:LF', 'mac' : 'MAC:CR' }

" ステータスラインを設定する関数
function! SetMyStatusLine()

  if mode() =~ 'n'
    let mode_name = 'Normal'
    let mode_color = 1

  elseif mode() =~ 'c'
    let mode_name = 'Command'
    let mode_color = 1

  elseif mode() =~ 'i'
    let mode_name = 'Insert'
    let mode_color = 2

  elseif mode() =~ 'R'
    let mode_name = 'Replace'
    let mode_color = 3

  elseif mode() =~ 'v'
    let mode_name = 'Visual'
    let mode_color = 4

  elseif mode() =~ 'V'
    let mode_name = 'Visual Line'
    let mode_color = 4

  elseif mode() =~ ''
    let mode_name = 'Visual Block'
    let mode_color = 4

  elseif mode() =~ 't'
    let mode_name = 'Terminal'
    let mode_color = 7

  else
    let mode_name = 'Mode: ' . mode()
    let mode_color = 5

  endif

  let mode_status   = '%'.mode_color.'*  '.mode_name.'  '
  let file_name     = '%6*  %<%F  ' 
  let file_status   = '%7* %M %R'

  let file_encoding = '%7*  %{&fileencoding}'
  let LF_code       = '%7*  %{ff_table[&ff]}  '
  let file_type     = '%8*  %{toupper(&ft)}  '
  let cursor_col    = '%9*  %03c列  '
  let cursor_row    = '%'.mode_color.'*  %p％／%L行 '
  let status_line   = mode_status . file_name . file_status . '%=' . file_encoding . LF_code . file_type . cursor_col . cursor_row

  return status_line

endfunction


" ==================================================================
" シンタックスの設定
" ==================================================================
" ユーザ定義シンタックス
function! SetMySyntax()
	" Operators
	syntax match cUserOperator "&&\|||"
	syntax match cUserOperator2 "<=\|>=\|<\|>\|==\|!=\|->"
	syntax match cUserOperator3 "(\|)\|{\|}\|\[\|\]"
	syntax match cUserOperator3 ",\|;"

	"UserFunction
	syntax match cUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=cType,cDelimiter,cDefine
endfunction

" 動作モード
let g:mode = "dark"

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
" --------------------------
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
function! SetDarkTheme(fg, bg, cursorBg, statuslineFg, statuslineBg, commandlineFg, commandlineBg)

	let g:mode = "dark"

	" カラーテーマの設定
	set background=dark
	highlight clear

	" ステータスラインの設定
	set statusline=%!SetMyStatusLine()

	" 行番号
	call s:setHighlight("LineNr", s:gray4, a:bg, "cterm=bold")
	call s:setHighlight("CursorLineNr", s:orange, a:bg, "cterm=bold")

	" カーソル行／列
	call s:setHighlight("CursorLine",   "", a:cursorBg, "cterm=bold")
	call s:setHighlight("CursorColumn", "", a:cursorBg, "cterm=bold")
	call s:setHighlight("MatchParen", s:black2, s:lightPink, "cterm=bold")

	" 文字
	call s:setHighlight("Normal", a:fg, a:bg, "")
	call s:setHighlight("Visual", "", s:gray, "cterm=bold")

	" 文字列
	call s:setHighlight("Comment", s:gray7, a:bg, "")
	call s:setHighlight("String",  s:blue, a:bg, "")

	" 記号／特殊文字
	call s:setHighlight("SpecialKey", s:gray2, a:bg, "")
	call s:setHighlight("SpecialChar", s:blueGreen, a:bg, "")

	" プリプロセッサ命令
	call s:setHighlight("PreProc", s:dilutePurple, a:bg, "")
	call s:setHighlight("Include", s:purple, a:bg, "")
	call s:setHighlight("Macro",   s:purple, a:bg, "")
	call s:setHighlight("PreCondit", s:bluePurple, a:bg, "")

	" if, for, while, do
	call s:setHighlight("Conditional", s:redPurple, a:bg, "")
	call s:setHighlight("Repeat", s:redPurple, a:bg, "")

	" 型
	call s:setHighlight("Type", s:green, a:bg, "")

	" 定数
	call s:setHighlight("Constant", s:magenta, a:bg, "")
	call s:setHighlight("Number", s:vermilion, a:bg, "")

	" C言語
	call s:setHighlight("cUserOperator", s:orange2, a:bg, "")
	call s:setHighlight("cUserOperator2", s:yellow, a:bg, "")
	call s:setHighlight("cUserOperator3", s:gray8, a:bg, "")
	call s:setHighlight("cUserOperator4", s:white255, a:bg, "")
	call s:setHighlight("cUserFunction", s:lightCyan2, a:bg, "")

	" シェルスクリプト
	call s:setHighlight("shShellVariables", s:blueGreen, a:bg, "")
	call s:setHighlight("shSetList", s:green, a:bg, "")

	" Pmenu
	call s:setHighlight("Pmenu", s:boldBlack, s:gray3, "")
	call s:setHighlight("PmenuSel", s:boldBlack, s:lightGreen2, "")

	" 検索
	call s:setHighlight("Search", a:bg, s:lightVermilion, "term=reverse")

	" Directory
	call s:setHighlight("Directory", s:darkCyan2, a:bg, "")

	" Vim statusline
	call s:setHighlight("User1", a:statuslineFg, s:blue, "cterm=bold gui=bold")
	call s:setHighlight("User2", a:statuslineFg, s:green, "cterm=bold gui=bold")
	call s:setHighlight("User3", a:statuslineFg, s:vermilion, "cterm=bold gui=bold")
	call s:setHighlight("User4", a:statuslineFg, s:orange, "cterm=bold gui=bold")
	call s:setHighlight("User5", a:statuslineFg, s:bluePurple, "cterm=bold gui=bold")
	call s:setHighlight("User6", a:statuslineFg, s:gray3, "cterm=bold gui=bold")
	call s:setHighlight("User7", a:statuslineFg, a:statuslineBg, "cterm=bold gui=bold")
	call s:setHighlight("User8", s:black, s:lightGray4, "cterm=bold gui=bold")
	call s:setHighlight("User9", s:black, s:white253, "cterm=bold gui=bold")

	" Vim commandline
	call s:setHighlight("MsgArea", a:commandlineFg, a:commandlineBg, "")
	call s:setHighlight("ModeMsg", a:commandlineFg, a:commandlineBg, "term=bold")
	call s:setHighlight("MoreMsg", a:commandlineFg, a:commandlineBg, "term=bold")
	call s:setHighlight("WarningMsg", s:vermilion, a:commandlineBg, "")
	call s:setHighlight("ErrorMsg", s:white255, s:red, "term=standout")
	call s:setHighlight("Question", s:white255, a:commandlineBg, "term=standout")

	" Vim Tabline
	call s:setHighlight("TabLine", a:fg, a:commandlineBg, "cterm=bold")
	call s:setHighlight("TabLineSel", a:bg, s:lightGray4, "cterm=bold")
	call s:setHighlight("TabLineFill", a:fg, a:bg, "cterm=bold")

	" vimdiff
	call s:setHighlight("DiffAdd", s:lightGreen, s:darkGreen, "")
	call s:setHighlight("DiffDelete", s:lightPink, s:darkRed, "")
	call s:setHighlight("DiffChange", s:boldBlack, s:darkCyan, "")
	call s:setHighlight("DiffText", s:lightMagenta, s:lightCyan, "cterm=bold")

	" netrw
	call s:setHighlight("netrwDir", s:blue, a:bg, "cterm=bold")
	call s:setHighlight("netrwExe", s:green, a:bg, "cterm=bold")
	call s:setHighlight("netrwClassify", s:blueGreen, a:bg, "cterm=bold")

endfunction

" --------------------------
function! SetLightTheme(fg, bg, cursorBg, statuslineFg, statuslineBg, commandlineFg, commandlineBg)

	let g:mode = "light"

	" カラーテーマの設定
	set background=light
	highlight clear

	" ステータスラインの設定
	set statusline=%!SetMyStatusLine()

	" 行番号
	call s:setHighlight("LineNr", s:darkRed, a:bg, "")
	call s:setHighlight("CursorLineNr", s:orange, a:bg, "cterm=bold")

	" カーソル行／列
	call s:setHighlight("CursorLine",   "", a:cursorBg, "cterm=bold")
	call s:setHighlight("CursorColumn", "", a:cursorBg, "cterm=bold")

	" 文字
	call s:setHighlight("Normal", a:fg, a:bg, "")
	call s:setHighlight("Visual", "", s:white251, "")

	" 文字列
	call s:setHighlight("Comment", s:lightBlue, a:bg, "")
	call s:setHighlight("String",  s:darkBlue, a:bg, "")

	" 記号／特殊文字
	call s:setHighlight("SpecialKey", s:white251, a:bg, "")
	call s:setHighlight("SpecialChar", s:diluteBlue2, a:bg, "")

	" プリプロセッサ命令
	call s:setHighlight("Include", s:darkPurple, a:bg, "")
	call s:setHighlight("Macro",   s:darkPurple, a:bg, "")
	call s:setHighlight("PreCondit", s:lightPurple, a:bg, "")

	" if, for, while, do
	call s:setHighlight("Conditional", s:bluePurple2, a:bg, "")
	call s:setHighlight("Repeat", s:bluePurple2, a:bg, "")

	" 型
	call s:setHighlight("Type", s:leafGreen, a:bg, "")

	" 定数
	call s:setHighlight("Constant", s:magenta, a:bg, "")
	call s:setHighlight("Number", s:red, a:bg, "")

	" シェルスクリプト
	call s:setHighlight("shShellVariables", s:blueGreen, a:bg, "")
	call s:setHighlight("shSetList", s:blue, a:bg, "")

	" Vim statusline
	call s:setHighlight("User1", a:statuslineFg, s:blue, "cterm=bold gui=bold")
	call s:setHighlight("User2", a:statuslineFg, s:green, "cterm=bold gui=bold")
	call s:setHighlight("User3", a:statuslineFg, s:vermilion, "cterm=bold gui=bold")
	call s:setHighlight("User4", a:statuslineFg, s:orange, "cterm=bold gui=bold")
	call s:setHighlight("User5", a:statuslineFg, s:bluePurple, "cterm=bold gui=bold")
	call s:setHighlight("User6", a:statuslineFg, s:gray3, "cterm=bold gui=bold")
	call s:setHighlight("User7", a:statuslineFg, a:statuslineBg, "cterm=bold gui=bold")
	call s:setHighlight("User8", s:black, s:lightGray4, "cterm=bold gui=bold")
	call s:setHighlight("User9", s:black, s:white253, "cterm=bold gui=bold")

	" vimdiff
	call s:setHighlight("DiffAdd", "", s:lightGreen2, "")
	call s:setHighlight("DiffDelete", "", s:lightVermilion, "")
	call s:setHighlight("DiffChange", "", s:lightCyan, "")
	call s:setHighlight("DiffText", s:lightMagenta, s:lightCyan, "cterm=bold")

	" netrw
	call s:setHighlight("netrwDir", s:darkBlue, a:bg, "cterm=bold")
	call s:setHighlight("netrwExe", s:leafGreen, a:bg, "cterm=bold")
	call s:setHighlight("netrwClassify", s:blueGreen, a:bg, "cterm=bold")

endfunction

" --------------------------
function! SetDefaultDark()

	" デフォルトカラーの定義
	let a:fg    = s:white
	let a:bg    = s:black
	let a:cursorBg = s:gray
	let a:statuslineFg  = s:white255
	let a:statuslineBg  = s:gray
	let a:commandlineFg = s:lightGray4
	let a:commandlineBg = s:gray

	call SetDarkTheme(a:fg, a:bg, a:cursorBg, a:statuslineFg, a:statuslineBg, a:commandlineFg, a:commandlineBg)

endfunction

" --------------------------
function! SetDefaultLight()

	" デフォルトカラーの定義
	let a:fg    = s:boldBlack
	let a:bg    = s:white253
	let a:cursorBg = s:white252
	let a:statuslineFg  = s:white255
	let a:statuslineBg  = s:gray
	let a:commandlineFg = s:lightGray4
	let a:commandlineBg = s:gray

	call SetLightTheme(a:fg, a:bg, a:cursorBg, a:statuslineFg, a:statuslineBg, a:commandlineFg, a:commandlineBg)

endfunction

" ---------------------------------
" ハイコントラストテーマ
" ---------------------------------
function! SetHighContrastDark()

	" デフォルトカラーの定義
	let a:fg    = s:white
	let a:bg    = s:black2
	let a:cursorBg = s:gray
	let a:statuslineFg  = s:white255
	let a:statuslineBg  = s:gray
	let a:commandlineFg = s:lightGray4
	let a:commandlineBg = s:gray

	call SetDarkTheme(a:fg, a:bg, a:cursorBg, a:statuslineFg, a:statuslineBg, a:commandlineFg, a:commandlineBg)

endfunction

" --------------------------
function! SetHighContrastLight()

	" デフォルトカラーの定義
	let a:fg    = s:boldBlack
	let a:bg    = s:white255
	let a:cursorBg = s:white254
	let a:statuslineFg  = s:white255
	let a:statuslineBg  = s:gray
	let a:commandlineFg = s:lightGray4
	let a:commandlineBg = s:gray

	call SetLightTheme(a:fg, a:bg, a:cursorBg, a:statuslineFg, a:statuslineBg, a:commandlineFg, a:commandlineBg)

endfunction

" ---------------------------------
" 初期化処理
" ---------------------------------
call InitHighlight(g:mode)
autocmd syntax * call SetMySyntax()


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
