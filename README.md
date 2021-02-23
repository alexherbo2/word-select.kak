# word-select.kak

Make <kbd>w</kbd> to move by word instead of word start.

## Dependencies

- [kakoune.cr]

[kakoune.cr]: https://github.com/alexherbo2/kakoune.cr

## Installation

Add [`word-select.kak`](rc/word-select.kak) to your autoload or source it manually.

``` kak
require-module word-select
```

## Usage

Enable word-select with `word-select-add-mappings`.

Or manually map <kbd>w</kbd> and its variants to `word-select-next-word` to move by word instead of word start.

## Commands

- `word-select-next-word`: Next word.
- `word-select-next-big-word`: Next big word.
- `word-select-previous-word`: Previous word.
- `word-select-previous-big-word`: Previous big word.

[Kakoune]: https://kakoune.org
