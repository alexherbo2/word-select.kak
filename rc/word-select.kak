provide-module word-select %{
  # Select word or next word
  define-command word-select-next-word -docstring 'Select word or next word' %{
    word-select-implementation '<a-:>' 'w' '/'
  }

  # Select WORD or next WORD
  define-command word-select-next-big-word -docstring 'Select WORD or next WORD' %{
    word-select-implementation '<a-:>' '<a-w>' '/'
  }

  # Select word or previous word
  define-command word-select-previous-word -docstring 'Select word or previous word' %{
    word-select-implementation '<a-;>' 'w' '<a-/>'
  }

  # Select WORD or previous WORD
  define-command word-select-previous-big-word -docstring 'Select WORD or previous WORD' %{
    word-select-implementation '<a-;>' '<a-w>' '<a-/>'
  }

  # Arguments are commands for direction(1), select-word(2) and select-next-word(3).
  #
  # Example: word-select-implementation '<a-:>' 'w' '/'
  define-command -hidden word-select-implementation -params 3 %{
    evaluate-commands -save-regs 's' %{
      # Save selections_desc
      set-register s %val{selections_desc}

      # Catch failures, such as <a-i>w on _*_
      try %{
        execute-keys '<a-i>' %arg{2} %arg{1}
      }

      # Compare initial and current selections_desc
      # If same, select the next word.
      evaluate-commands %sh{
        # Prelude
        . "$kak_opt_prelude_path"

        if [ "$kak_selections_desc" = "$kak_reg_s" ]; then
          kak_escape execute-keys "${3}\w<ret><a-i>${2}${1}"
        fi
      }
    }
  }
}
