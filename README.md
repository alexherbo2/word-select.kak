# word-select.kak

Map <kbd>w</kbd> to move by word instead of word start.

## Installation

Add [`word-select.kak`](rc/word-select.kak) to your autoload or source it manually.

## Usage

Map <kbd>w</kbd> to `word-select-next-word` to move by word instead of word start.

## Configuration

``` kak
map global normal w ': word-select-next-word<ret>'
map global normal <a-w> ': word-select-next-big-word<ret>'
map global normal b ': word-select-previous-word<ret>'
map global normal <a-b> ': word-select-previous-big-word<ret>'
```

### More controversial mappings

Move <kbd>b</kbd> to <kbd>q</kbd>, so that <kbd>q</kbd><kbd>w</kbd><kbd>e</kbd> actions are aligned.

``` kak
# Move macros to ^
map global normal ^ q
map global normal <a-^> Q

# Move [b] to [q], so that [qwe] actions are aligned.
map global normal q ': word-select-previous-word<ret>'
map global normal <a-q> ': word-select-previous-big-word<ret>'
map global normal Q B
map global normal <a-Q> <a-B>
```

[Kakoune]: https://kakoune.org
