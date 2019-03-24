define-command word-movement-next-word -docstring 'Select next word' 'word-movement <a-:> w e'
define-command word-movement-next-big-word -docstring 'Select next WORD' 'word-movement <a-:> <a-w> <a-e>'
define-command word-movement-previous-word -docstring 'Select previous word' 'word-movement "<a-;>" w b'
define-command word-movement-previous-big-word -docstring 'Select previous WORD' 'word-movement "<a-;>" <a-w> <a-b>'

define-command -hidden word-movement -params 3 %{
  evaluate-commands -itersel -save-regs '/' %{
    try %{
      execute-keys -save-regs '' '<a-*>'
      set-register / "\A%reg(/)\z"
      execute-keys "<a-:>%arg(1);<a-i>%arg(2)<a-:>%arg(1)"
      try %{
        execute-keys '<a-K><ret>'
      } catch %{
        execute-keys "%arg(3)<a-i>%arg(2)"
      }
    } catch %{
      execute-keys "%arg(3)<a-i>%arg(2)"
    } catch %{
      execute-keys ';'
    }
  }
}

define-command word-movement-map -params 2 -docstring 'Generate a word movement mapping with {direction} and {key} arguments' %{
  map global normal %arg(2) ":<space>word-movement-%arg(1)-word<ret>"
  map global normal "<a-%arg(2)>" ":<space>word-movement-%arg(1)-big-word<ret>"
}
