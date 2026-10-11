# houseofmackee/tap

Homebrew casks for [CleanShotZ](https://github.com/houseofmackee/cleanshotz),
a free and open source macOS menu bar app for screenshots, screen recordings
and annotations.

```sh
brew install --cask houseofmackee/tap/cleanshotz
```

This also links the `cleanshotz` command line tool. CleanShotZ updates
itself (Check for Updates… in its menu), so `brew upgrade` leaves it alone;
`brew upgrade --cask --greedy cleanshotz` updates it through Homebrew
instead. `brew uninstall --zap --cask cleanshotz`
also removes its settings, history and logs.

CleanShotZ needs macOS 14 or later on Apple silicon. Releases are signed with
a Developer ID and notarized by Apple. The cask is updated automatically when
a new release is published.
