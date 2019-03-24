" Copied from ayu
let s:palette = {}

let s:palette.bg        = {'dark': "#0F1419",  'light': "#FAFAFA",  'mirage': "#212733"}

let s:palette.comment   = {'dark': "#5C6773",  'light': "#ABB0B6",  'mirage': "#5C6773"}
let s:palette.markup    = {'dark': "#F07178",  'light': "#F07178",  'mirage': "#F07178"}
let s:palette.constant  = {'dark': "#FFEE99",  'light': "#A37ACC",  'mirage': "#D4BFFF"}
let s:palette.operator  = {'dark': "#E7C547",  'light': "#E7C547",  'mirage': "#80D4FF"}
let s:palette.tag       = {'dark': "#36A3D9",  'light': "#36A3D9",  'mirage': "#5CCFE6"}
let s:palette.regexp    = {'dark': "#95E6CB",  'light': "#4CBF99",  'mirage': "#95E6CB"}
let s:palette.string    = {'dark': "#B8CC52",  'light': "#86B300",  'mirage': "#BBE67E"}
let s:palette.function  = {'dark': "#FFB454",  'light': "#F29718",  'mirage': "#FFD57F"}
let s:palette.special   = {'dark': "#E6B673",  'light': "#E6B673",  'mirage': "#FFC44C"}
let s:palette.keyword   = {'dark': "#FF7733",  'light': "#FF7733",  'mirage': "#FFAE57"}

let s:palette.error     = {'dark': "#FF3333",  'light': "#FF3333",  'mirage': "#FF3333"}
let s:palette.accent    = {'dark': "#F29718",  'light': "#FF6A00",  'mirage': "#FFCC66"}
let s:palette.panel     = {'dark': "#14191F",  'light': "#FFFFFF",  'mirage': "#272D38"}
let s:palette.guide     = {'dark': "#2D3640",  'light': "#D9D8D7",  'mirage': "#3D4751"}
let s:palette.line      = {'dark': "#151A1E",  'light': "#F3F3F3",  'mirage': "#242B38"}
let s:palette.selection = {'dark': "#253340",  'light': "#F0EEE4",  'mirage': "#343F4C"}
let s:palette.fg        = {'dark': "#E6E1CF",  'light': "#5C6773",  'mirage': "#D9D7CE"}
let s:palette.fg_idle   = {'dark': "#3E4B59",  'light': "#828C99",  'mirage': "#607080"}

exec "highlight texBeginEnd guifg=".s:palette.constant.mirage
exec "highlight texBeginEndName guifg=".s:palette.operator.mirage

exec "highlight texType guifg=".s:palette.keyword.dark
exec "highlight Delimiter guifg=".s:palette.constant.dark

exec "highlight texMathSymbol guifg=".s:palette.regexp.light
exec "highlight texGreek guifg=".s:palette.regexp.light
exec "highlight texStatement guifg=".s:palette.special.dark

exec "highlight texMath guifg=".s:palette.function.light
exec "highlight texSuperscript guifg=".s:palette.function.light
exec "highlight texSubscript guifg=".s:palette.function.light

" Why don't these exist
call TexNewMathZone("A","align",1)
call TexNewMathZone("B","alignat",1)
call TexNewMathZone("C","displaymath",1)
call TexNewMathZone("D","eqnarray",1)
call TexNewMathZone("E","equation",1)
call TexNewMathZone("F","flalign",1)
call TexNewMathZone("G","gather",1)

"
syntax include @ASY after/syntax/asy.vim
syntax region asySnip matchgroup=Snip start="\\begin{asy}" end="\\end{asy}" contains=@ASY containedin=texPartZone,texChapterZone,texSectionZone,texSubSectionZone,texSubSubSectionZone,texDocZone
syntax region asySnip matchgroup=Snip start="\\begin{asydef}" end="\\end{asydef}" contains=@ASY containedin=texPartZone,texChapterZone,texSectionZone,texSubSectionZone,texSubSubSectionZone,texDocZone
hi link Snip PreProc

syntax match texMathSymbol "\\subsetneq\>"

syntax match texTypeStyle	"\\vocab\>"

syntax match texMathSymbol "\\half\>"
syntax match texMathSymbol "\\eps\>"
syntax match texMathSymbol "\\nullset\>"
"syntax match texMathSymbol "\\EE\>"
"syntax match texMathSymbol "\\PP\>"
"syntax match texMathSymbol "\\FF\>"
"syntax match texMathSymbol "\\NN\>"
"syntax match texMathSymbol "\\ZZ\>"
"syntax match texMathSymbol "\\QQ\>"
"syntax match texMathSymbol "\\RR\>"
"syntax match texMathSymbol "\\CC\>"
"syntax match texMathSymbol "\\HH\>"
syntax match texMathSymbol "\\intersect\>"
syntax match texMathSymbol "\\bigintersect\>"
syntax match texMathSymbol "\\union\>"
syntax match texMathSymbol "\\bigunion\>"
syntax match texMathSymbol "\\dang\>"
syntax match texMathSymbol "\\iso\>"
