# Word Movement

[![IRC][IRC Badge]][IRC]

###### [Usage](#usage) | [Documentation](#commands) | [Contributing](CONTRIBUTING)

> Simpler word movements for [Kakoune].

[![asciicast](https://asciinema.org/a/236149.svg)](https://asciinema.org/a/236149)

## Installation

### [Pathogen]

``` kak
pathogen-infect /home/user/repositories/github.com/alexherbo2/word-movement.kak
```

## Usage

``` kak
word-movement-map next w
word-movement-map previous b
```

## Commands

- `word-movement-next-word`: Select next word
- `word-movement-next-word-extending`: Extend to next word
- `word-movement-next-big-word`: Select next WORD
- `word-movement-next-big-word-extending`: Extend to next WORD
- `word-movement-previous-word`: Select previous word
- `word-movement-previous-word-extending`: Extend to previous word
- `word-movement-previous-big-word`: Select previous WORD
- `word-movement-previous-big-word-extending`: Extend to previous WORD
- `word-movement-map {direction} {key}`: Generate a word movement mapping with `direction` and `key` arguments

## About

The extension was created after discussing with [@occivink] about the [controversial mappings]
and the word movements in general.

[Kakoune]: https://kakoune.org
[IRC]: https://webchat.freenode.net?channels=kakoune
[IRC Badge]: https://img.shields.io/badge/IRC-%23kakoune-blue.svg
[Pathogen]: https://github.com/alexherbo2/pathogen.kak
[Controversial mappings]: https://github.com/Delapouite/kakoune-buffers#more-controversial-mappings
[@occivink]: https://github.com/occivink
