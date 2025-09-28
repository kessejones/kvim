" Vim syntax file
" Language: Kes
" Latest Revision: 2025-08-03

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

let s:kes_syntax_keywords = {
    \   'kesConditional' :["if"
    \ ,                     "else"
    \ ,                    ]
    \ , 'kesBoolean' :["true"
    \ ,                 "false"
    \ ,                ]
    \ , 'kesKeyword' :["fn"
    \ ,                 "import"
    \ ,                 "extern"
    \ ,                 "return"
    \ ,                 "for"
    \ ,                 "while"
    \ ,                 "using"
    \ ,                 "as"
    \ ,                 "mod"
    \ ,                ]
    \ , 'kesMacro' :["defer"
    \ ,               "size_of"
    \ ,              ]
    \ , 'kesWordOperator' :["not"
    \ ,                      "and"
    \ ,                      "or"
    \ ,                      "is"
    \ ,                     ]
    \ , 'kesVarDecl' :["var"
    \ ,                ]
    \ , 'kesType' :["i8"
    \ ,              "i16"
    \ ,              "i32"
    \ ,              "i64"
    \ ,              "u8"
    \ ,              "u16"
    \ ,              "u32"
    \ ,              "u64"
    \ ,              "f32"
    \ ,              "f64"
    \ ,              "bool"
    \ ,              "string"
    \ ,              "cstring"
    \ ,              "void"
    \ ,              "null"
    \ ,             ]
    \ , 'kesStructure' :["struct"
    \ ,                   "enum"
    \ ,                  ]
    \ , }


function! s:syntax_keyword(dict)
  for key in keys(a:dict)
    execute 'syntax keyword' key join(a:dict[key], ' ')
  endfor
endfunction

call s:syntax_keyword(s:kes_syntax_keywords)

" Declarations
syntax match kesFunction /\w\+\s*(/me=e-1,he=e-1
syntax match kesFunctionDecl "\v<\w*>(\s*::\s*fn)@="
syntax match kesExternFunctionDecl "\v<\w*>(\s*::\s*extern\s*fn)@="
syntax match kesStructDecl "\v<\w*>(\s*::\s*struct)@="
syntax match kesEnumDecl "\v<\w*>(\s*::\s*enum)@="
syntax match kesVarDecl /\v<\w*>(\s*\:\=)@=/ms=s,he=e
syntax match kesVarDeclTyped /\v<\w*>(\s*\:\s*\w*\s*[^:]\=?)@=/ms=s,he=e

syntax match kesConstant "\v<\w*>(\s*::\s*^enum|^struct|^fn)@="
syntax match kesVarDeclAssign ":=" display
syntax match kesVarAssign "=" display

" Literal Numbers
syntax match kesDecNumber display  "\v<\d%(_?\d)*"
syntax match kesHexNumber display "\v<0x\x%(_?\x)*"
syntax match kesOctNumber display "\v<0o\o%(_?\o)*"
syntax match kesBinNumber display "\v<0b[01]%(_?[01])*"

syntax region kesString matchgroup=kesStringDelimiter start=+"+ skip=+\\"+ end=+"+ contains=kesEscape
syntax region kesChar matchgroup=kesCharDelimiter start=+'+ skip=+\\\\\|\\'+ end=+'+ oneline contains=kesEscape
syntax match kesEscape display contained /\\./

syntax match kesMember /\v<\w*>\.\w@=/ms=s,he=e-1

" Comment
syntax region kesCommentLine start="//" end="$"

" Range
syntax match kesRange display "\V.."
syntax region kesBlock start="{" end="}" transparent fold

" *** Highlights

highlight default link kesDecNumber kesNumber
highlight default link kesHexNumber kesNumber
highlight default link kesOctNumber kesNumber
highlight default link kesBinNumber kesNumber

highlight default link kesVarDeclAssign kesOperator
highlight default link kesVarAssign kesOperator
highlight default link kesRange kesOperator

highlight default link kesStructDecl kesStructure
highlight default link kesClassDecl kesStructure
highlight default link kesEnumDecl kesStructure
highlight default link kesFunctionDecl kesFunction
highlight default link kesExternFunctionDecl kesFunction
highlight default link kesDeclaration Operator

highlight default link kesNull Type
highlight default link kesKeyword Keyword
highlight default link kesType Type
highlight default link kesCommentLine Comment
highlight default link kesString String
highlight default link kesStringDelimiter String
highlight default link kesChar String
highlight default link kesCharDelimiter String
highlight default link kesEscape Special
highlight default link kesBoolean Boolean
highlight default link kesConstant Constant
highlight default link kesNumber Number
highlight default link kesOperator Operator
highlight default link kesOperator Operator
highlight default link kesExecution Special
highlight default link kesMacro Macro
highlight default link kesConditional Conditional

highlight default link kesStructure Structure
highlight default link kesFunction Function

highlight default link kesVarDecl Identifier
highlight default link kesVarDeclTyped Identifier
highlight default link kesVar Identifier
highlight default link kesMember Identifier

delfunction s:syntax_keyword

let b:current_syntax = "kes"

let &cpo = s:cpo_save
unlet! s:cpo_save
