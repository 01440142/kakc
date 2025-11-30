hook global WinSetOption filetype=c %{
    set buffer formatcmd 'clang-format -style=llvm'
    hook buffer BufWritePre .* format

    set buffer static_words \
        "_Bool" "_Complex" "_Imaginary" "auto" "break" "case" "char" "const" \
        "continue" "default" "do" "double" "else" "enum" "extern" "float" \
        "for" "goto" "if" "inline" "int" "long" "register" "restrict" \
        "return" "short" "signed" "sizeof" "static" "typedef" "union" \
        "unsigned" "void" "volatile" "while"

    hook buffer InsertChar f %{ try %{
        exec -draft h<a-f>\; <a-k>\;if<ret> cif(){} <esc>:format<ret>
    } }
    hook buffer InsertChar f %{ try %{
        exec -draft h<a-f>\; <a-k>\;elseif<ret> cif(){}else<space>if(){} <esc>:format<ret>
    } }
    hook buffer InsertChar h %{ try %{
        exec -draft h<a-f>\; <a-k>\;switch<ret> cswitch(){case<space>:break\;default:break\;} <esc>:format<ret>
    } }
    hook buffer InsertChar r %{ try %{
        exec -draft h<a-f>\; <a-k>\;for<ret> cfor(int<space>i=0\;i<0\;i++){} <esc>:format<ret>
    } }
    hook buffer InsertChar e %{ try %{
        exec -draft h<a-f>\; <a-k>\;while<ret> cwhile(){} <esc>:format<ret>
    } }
    hook buffer InsertChar o %{ try %{
        exec -draft h<a-f>\; <a-k>\;do<ret> cdo{}while()\; <esc>:format<ret>
    } }
}
