# word-select.kak

Make <kbd>w</kbd> to move by word instead of word start.

## Dependencies

- [prelude.kak]

[prelude.kak]: https://github.com/alexherbo2/prelude.kak

## Installation

Add [`word-select.kak`](rc/word-select.kak) to your autoload or source it manually.

``` kak
require-module word-select
```

## Usage

Enable word-select with `word-select-add-mappings`.

Or manually map <kbd>w</kbd> and its variants to `word-select-next-word` to move by word instead of word start.

[Kakoune]: https://kakoune.org
