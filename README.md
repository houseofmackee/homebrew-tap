# houseofmackee/tap

Homebrew casks for free and open source macOS menu bar apps:

- [CleanShotZ](https://github.com/houseofmackee/cleanshotz): screenshots,
  screen recordings and annotations.
- [Pasted](https://github.com/houseofmackee/pasted): clipboard history with
  pinboards, search and snippets.
- [Yoinks](https://github.com/houseofmackee/yoinks): a drag-and-drop shelf
  with clipboard history.

```sh
brew install --cask houseofmackee/tap/cleanshotz
brew install --cask houseofmackee/tap/pasted
brew install --cask houseofmackee/tap/yoinks
```

Each cask also links the app's command line tool (`cleanshotz`, `pasted`,
`yoinks`). All three apps update themselves (Check for Updates… in their menus), so
`brew upgrade` leaves them alone; `brew upgrade --cask --greedy <name>`
updates one through Homebrew instead. `brew uninstall --zap --cask <name>`
also removes its settings and data.

All need Apple silicon: CleanShotZ and Pasted macOS 14 or later, Yoinks
macOS 13 or later. Releases are signed with a Developer ID and notarized by Apple. The
casks are updated automatically when a new release is published.
