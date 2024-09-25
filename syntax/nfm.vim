" Vim syntax file
" Language: No-Flavor Markdown
" Maintainer: Frankie Baffa

if exists('b:current_syntax')
	finish
endif

let b:current_syntax = "nfm"

highlight NfmInline term=NONE cterm=NONE gui=NONE
highlight NfmBold term=bold cterm=bold gui=bold
highlight NfmItalic term=bold cterm=italic gui=italic
highlight NfmUnderline term=bold cterm=underline gui=underline
highlight NfmStrikethrough term=bold cterm=strikethrough gui=strikethrough

syntax cluster NfmBlock contains=NfmH1,NfmH2,NfmH3,NfmH4,NfmH5,NfmH6,NfmHr,
			\ NfmPreCode

syntax cluster NfmInline contains=NfmBr,NfmStrong,NfmEmphasis,NfmDeleted,
			\ NfmInserted,NfmMarked,NfmAnchor,NfmCheckBox,NfmCheckedBox,NfmLink,
			\ NfmImage,NfmCode

syntax region NfmH1 matchgroup=Statement start=/^#/ end=/\s*$/ oneline keepend
			\ contains=@NfmInline
highlight default link NfmH1 Title

syntax region NfmH2 matchgroup=Statement start=/^##/ end=/\s*$/ oneline keepend
			\ contains=@NfmInline
highlight default link NfmH2 Title

syntax region NfmH3 matchgroup=Statement start=/^###/ end=/\s*$/ oneline keepend
			\ contains=@NfmInline
highlight default link NfmH3 Title

syntax region NfmH4 matchgroup=Statement start=/^####/ end=/\s*$/ oneline keepend
			\ contains=@NfmInline
highlight default link NfmH4 Title

syntax region NfmH5 matchgroup=Statement start=/^#####/ end=/\s*$/ oneline keepend
			\ contains=@NfmInline
highlight default link NfmH5 Title

syntax region NfmH6 matchgroup=Statement start=/^######/ end=/\s*$/ oneline keepend
			\ contains=@NfmInline
highlight default link NfmH6 Title

syntax match NfmHr /^- - -$/
highlight default link NfmHr Statement

syntax region NfmPreCode start=/^\n \{4,}/ end=/^\ze \{,3}\S.*$/ keepend
			\ contains=NONE
highlight default link NfmPreCode String

syntax region NfmPreCodeLang matchgroup=Statement start=/^```/ end=/^```$/ keepend
			\ contains=NONE
highlight default link NfmPreCodeLang String

syntax match NfmUlLi /^\%( \{0,4\}\)*-\%( - -$\)\@!\%(\s\+\S\)\@=/ contains=@NfmInline
highlight default link NfmUlLi Statement

syntax match NfmOlLi /^\%( \{0,4}\)*0\.\%(\s\+\S\)\@=/ contains=@NfmInline
highlight default link NfmOlLi Statement

syntax region NfmBlockquote matchgroup=Statement start=/^>/ end=/$/ oneline
			\ contains=@NfmInline
highlight default link NfmBlockquote Comment

syntax match NfmTableCellText /[^|]\+/ contained
			\ nextgroup=NfmTableCellStart

syntax match NfmTableCellRowSpan /,\%([0-9]\+\|_\)/ contained
			\ nextgroup=NfmTableCellText
highlight default link NfmTableCellRowSpan Macro

syntax match NfmTableCellColSpan /\%([0-9]\+\|_\)/ contained
			\ nextgroup=NfmTableCellRowSpan,NfmTableCellText
highlight default link NfmTableCellColSpan Macro

syntax match NfmTableCellVAlign /\%(t\|m\|b\|_\)/ contained
			\ nextgroup=NfmTableCellColSpan,NfmTableCellRowSpan,NfmTableCellText
highlight default link NfmTableCellVAlign Macro

syntax match NfmTableCellAlign /\%(\^\|\$\|_\)/ contained
			\ nextgroup=NfmTableCellVAlign,NfmTableCellColSpan,
			\ NfmTableCellRowSpan,NfmTableCellText
highlight default link NfmTableCellAlign Macro

syntax match NfmTableCellType /\%(=\|-\|_\)/ contained
			\ nextgroup=NfmTableCellAlign,NfmTableCellVAlign,NfmTableCellColSpan,
			\ NfmTableCellRowSpan,NfmTableCellText
highlight default link NfmTableCellType Macro

syntax match NfmTableCellStart /|/ contained
			\ nextgroup=NfmTableCellType,NfmTableCellAlign,NfmTableCellValign,
			\ NfmTableCellColSpan,NfmTableCellRowSpan,NfmTableCellText
highlight default link NfmTableCellStart Statement

syntax match NfmTableCell /^\%(|\)\@=/me=e-1
			\ nextgroup=NfmTableCellStart

syntax match NfmOffsetTableCell /^\s\+\%(|\)\@=/
			\ nextgroup=NfmTableCellStart

syntax match NfmBr / \{2\}$/me=e-1

syntax region NfmStrong matchgroup=Statement
			\ start=/\%(\\\)\@<!\*\*/ skip=/\\\*/ end=/\%(\*\*\|$\n$\)/
			\ keepend
			\ contains=@NfmInline
highlight default link NfmStrong NfmBold

syntax region NfmEmphasis matchgroup=Statement
			\ start=/\%(\\\)\@<!_/ skip=/\\_/ end=/\%(_\|$\n$\)/
			\ keepend
			\ contains=@NfmInline
highlight default link NfmEmphasis NfmItalic

syntax region NfmDeleted matchgroup=Statement
			\ start=/\%(\\\)\@<!\~\~/ skip=/\\\~/ end=/\%(\~\~\|$\n$\)/
			\ keepend
			\ contains=@NfmInline
highlight default link NfmDeleted NfmStrikethrough

syntax region NfmInserted matchgroup=Statement
			\ start=/\%(\\\)\@<!++/ skip=/\\+/ end=/\%(++\|$\n$\)/
			\ keepend
			\ contains=@NfmInline
highlight default link NfmInserted NfmUnderline

syntax region NfmMarked matchgroup=Statement
			\ start=/\%(\\\)\@<!==/ skip=/\\=/ end=/\%(==\|$\n$\)/
			\ keepend
			\ contains=@NfmInline
highlight default link NfmMarked NfmBold

syntax region NfmSuper matchgroup=Statement
			\ start=/\%(\\\)\@<!\^/ skip=/\\\^/ end=/\%(\^\|$\n$\)/
			\ keepend
			\ contains=@NfmInline
highlight default link NfmSuper NfmInline

syntax region NfmAnchor matchgroup=Comment
			\ start=/\%(\\\)\@<!</ skip=/\\>/ end=/>/
			\ keepend
			\ contains=NONE
highlight default link NfmAnchor Comment

syntax match NfmCheckBox /\%(\\\)\@<!\[ \]/
highlight default link NfmCheckBox Statement

syntax match NfmCheckedBox /\%(\\\)\@<!\[x\]/
highlight default link NfmCheckedBox Statement

syntax cluster NfmLinkMembers contains=NfmLinkText,NfmLinkUrl

syntax match NfmLinkText /\%(\[\)\@<=.*\%(\]\)\@=/ contained
highlight default link NfmLinkText NfmUnderline

syntax match NfmLinkUrl /\%((\)\@<=.*\%()\)\@=/ contained
highlight default link NfmLinkUrl Comment

syntax match NfmLink /\%(\\\|\!\)\@<!\[.*\](.*)/ contains=@NfmLinkMembers
highlight default link NfmLink Statement

syntax cluster NfmImageMembers contains=NfmImageText,NfmImageUrl

syntax match NfmImageText /\%(\[\)\@<=.*\%(\]\)\@=/ contained
highlight default link NfmImageText NfmInline

syntax match NfmImageUrl /\%((\)\@<=.*\%()\)\@=/ contained
highlight default link NfmImageUrl Comment

syntax match NfmImage /\%(\\\)\@<!\!\[.*\](.*)/ contains=@NfmImageMembers
highlight default link NfmImage Statement

syntax region NfmCode matchgroup=Statement start=/\%(\\\)\@<!`/ skip=/\\`/ end=/`/
			\ contains=NONE
highlight default link NfmCode String

syntax sync fromstart
