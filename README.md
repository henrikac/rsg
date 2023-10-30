# RSG (Random String Generator)

A random string generator.

## Requirements

- [Crystal](https://crystal-lang.org) is required to build the project

## Installation

- Clone the project
- Run `crystal build src/rsg.cr`
- Move the binary into a folder that is in your `PATH`, e.g. `$HOME/.local/bin`

## Usage

```
$ rsg -c
pCgkGGmRIcGZFIDPtaBnggXjqqKuaEYU

$ rsg -d
28334261621948777759686618901126

$ rsg -c -d
YpY9mAVVw3LliNvDZrnhNfU0Kjm5rxCE

$rsg -c -d -l 50
Nk0Pum2Jui88Y7d64U4mUsxkclVHR33KEF6VqdVwiaOyPqE1aw
```

## Contributing

1. Fork it (<https://github.com/henrikac/rsg/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Henrik Christensen](https://github.com/henrikac) - creator and maintainer
