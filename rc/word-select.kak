provide-module word-select %{
  define-command word-select-next-word -docstring 'Select word or next word' %{
    word-select-implementation '<a-:>' 'w' '/'
  }
  define-command word-select-next-big-word -docstring 'Select WORD or next WORD' %{
    word-select-implementation '<a-:>' '<a-w>' '/'
  }
  define-command word-select-previous-word -docstring 'Select word or previous word' %{
    word-select-implementation '<a-;>' 'w' '<a-/>'
  }
  define-command word-select-previous-big-word -docstring 'Select WORD or previous WORD' %{
    word-select-implementation '<a-;>' '<a-w>' '<a-/>'
  }
  # Arguments are commands for direction(1), select-word(2) and select-next-word(3).
  # Example: word-select-implementation '<a-:>' 'w' '/'
  define-command -hidden word-select-implementation -params 3 %{
    evaluate-commands -save-regs 's' %{
      set-register s %val{selections_desc}
      # Catch failures, such as <a-i>w on _*_
      try %{
        execute-keys '<a-i>' %arg{2} %arg{1}
      }
      # Compare initial and current selections_desc
      # If same, select the next word.
      evaluate-commands %sh{
        if test "$kak_selections_desc" = "$kak_reg_s"; then
          printf "
            execute-keys '%s\\w<ret><a-i>%s%s'
          " "$3" "$2" "$1"
        fi
      }
    }
  }
}
