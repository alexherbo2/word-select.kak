define-command word-movement-next-word -docstring 'Select next word' 'word-movement <a-:> w e'
define-command word-movement-next-big-word -docstring 'Select next WORD' 'word-movement <a-:> <a-w> <a-e>'
define-command word-movement-previous-word -docstring 'Select previous word' 'word-movement "<a-;>" w b'
define-command word-movement-previous-big-word -docstring 'Select previous WORD' 'word-movement "<a-;>" <a-w> <a-b>'

define-command word-movement-next-word-extending -docstring 'Extend to next word' 'word-movement-extending next-word'
define-command word-movement-next-big-word-extending -docstring 'Extend to next WORD' 'word-movement-extending next-big-word'
define-command word-movement-previous-word-extending -docstring 'Extend to previous word' 'word-movement-extending previous-word'
define-command word-movement-previous-big-word-extending -docstring 'Extend to previous WORD' 'word-movement-extending previous-big-word'

define-command word-movement-skip-next-word -docstring 'Skip next word' 'execute-keys "<a-:>""_/\s+<ret>"'
define-command word-movement-skip-next-word-extending -docstring 'Extend skip-next-word' 'execute-keys "<a-:>""_?\s+<ret>"'
define-command word-movement-skip-previous-word -docstring 'Skip previous word' 'execute-keys "<a-:><a-;>""_<a-/>\s+<ret>"'
define-command word-movement-skip-previous-word-extending -docstring 'Extend skip-previous-word' 'execute-keys "<a-:><a-;>""_<a-?>\s+<ret>"'

define-command -hidden word-movement-extending -params 1 %{
  evaluate-commands -itersel -save-regs '/^' %{
    execute-keys -save-regs '' '<a-*>'
    set-register / "\A%reg(/)\z"
    execute-keys -save-regs '' 'Z'
    evaluate-commands "word-movement-%arg(1)"
    execute-keys ';<a-z>u'
    try %{
      execute-keys '<a-K><ret>'
    } catch %{
      evaluate-commands "word-movement-%arg(1)"
      evaluate-commands "word-movement-%arg(1)"
      execute-keys '<a-z>u'
    }
  }
}

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
    execute-keys "<a-:>%arg(1)"
  }
}

define-command word-movement-map -params 2 -docstring 'Generate a word movement mapping with {next,previous,skip} and {key} arguments' %{ evaluate-commands %sh{
  case "$1" in
    previous|next)
      printf 'word-movement-map-word %s %s' "$1" "$2"
    ;;
    skip)
      printf 'word-movement-map-skip-word %s' "$2"
    ;;
    *)
      printf 'fail Usage: word-movement-map {next,previous,skip} {key}'
    ;;
  esac
}}

define-command -hidden word-movement-map-word -params 2 %{
  map global normal %arg(2) ":<space>word-movement-%arg(1)-word<ret>"
  map global normal "<a-%arg(2)>" ":<space>word-movement-%arg(1)-big-word<ret>"
  evaluate-commands -save-regs 'K' %{
    set-register K %sh(echo "$2" | tr '[:lower:]' '[:upper:]')
    map global normal %reg(K) ":<space>word-movement-%arg(1)-word-extending<ret>"
    map global normal "<a-%reg(K)>" ":<space>word-movement-%arg(1)-big-word-extending<ret>"
  }
}

define-command -hidden word-movement-map-skip-word -params 1 %{
  map global normal %arg(1) ':<space>word-movement-skip-next-word<ret>'
  map global normal "<a-%arg(1)>" ':<space>word-movement-skip-previous-word<ret>'
  evaluate-commands -save-regs 'K' %{
    set-register K %sh(echo "$1" | tr '[:lower:]' '[:upper:]')
    map global normal %reg(K) ':<space>word-movement-skip-next-word-extending<ret>'
    map global normal "<a-%reg(K)>" ':<space>word-movement-skip-previous-word-extending<ret>'
  }
}
