colorscheme custom
addhl global/ number-lines -relative
addhl global/ show-matching
set -add global ui_options terminal_assistant=none
set global modelinefmt '{{mode_info}} %val{cursor_line}:%val{cursor_char_column} {{context_info}}%val{bufname} %val{session}'

map global goto n '<esc>:bn<ret>' -docstring 'next buffer'
map global goto p '<esc>:bp<ret>' -docstring 'previous buffer'
map global goto / '<esc>:search ' -docstring 'search file'

map global user b ':buffer ' -docstring 'edit buffer'
map global user c ':comment-line<ret>' -docstring 'comment lines'
map global user p '<a-!>tmux show-buffer<ret>' -docstring 'paste tmux buffer'
map global user q ':q!<ret>' -docstring 'force quit'
map global user w ':wa<ret>' -docstring 'write all buffers'
map global user x ':db<ret>' -docstring 'delete buffer'

hook global InsertChar j %{ try %{
    exec -draft hH <a-k>jj<ret> d
    exec -with-hooks <esc>
}}

define-command search -docstring "search file" -params 1 %{ edit %arg{1} }
complete-command search shell-script-candidates %{ find . -type f }
