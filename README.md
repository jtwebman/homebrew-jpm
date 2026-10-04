# homebrew-jpm

The [Homebrew](https://brew.sh) tap for [jpm](https://github.com/jtwebman/jpm), a fast, small,
secure-by-default package manager for JavaScript. macOS (Apple silicon and Intel) and Linux
(x64 and arm64).

```sh
brew install jtwebman/jpm/jpm
```

`brew upgrade jpm` takes each new release. The formula installs jpm's release binaries, the
ones `curl -fsSL https://getjpm.sh | sh` installs, after checking their SHA-256; the release
workflow of jtwebman/jpm updates it for every release.

More about jpm: [getjpm.sh](https://getjpm.sh).
