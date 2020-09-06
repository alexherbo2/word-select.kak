# word-select.kak

Map <kbd>w</kbd> to move by word instead of word start.

## Installation

Add [`word-select.kak`](rc/word-select.kak) to your autoload or source it manually.

``` kak
require-module word-select
```

## Usage

Map <kbd>w</kbd> to `word-select-next-word` to move by word instead of word start.

## Configuration

``` kak
map global normal w ': word-select-next-word<ret>'
map global normal <a-w> ': word-select-next-big-word<ret>'
map global normal b ': word-select-previous-word<ret>'
map global normal <a-b> ': word-select-previous-big-word<ret>'
```

[Kakoune]: https://kakoune.org
