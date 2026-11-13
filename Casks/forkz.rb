cask "forkz" do
  version "0.20.2"
  sha256 "610c53598b80d7667bf36496d48cb86330e14eb0f85f602c96901b9ee9af7295"

  url "https://github.com/houseofmackee/forkz/releases/download/v#{version}/forkz-#{version}-arm64.dmg"
  name "forkz"
  desc "Dual-pane file manager with SFTP"
  homepage "https://github.com/houseofmackee/forkz"

  livecheck do
    url "https://github.com/houseofmackee/forkz.git"
    strategy :git
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "forkz.app"
  binary "#{appdir}/forkz.app/Contents/MacOS/forkz"

  uninstall quit: "io.github.houseofmackee.forkz"

  zap trash: [
    "~/Library/Application Support/forkz",
    "~/Library/Caches/io.github.houseofmackee.forkz",
    "~/Library/HTTPStorages/io.github.houseofmackee.forkz",
    "~/Library/Preferences/io.github.houseofmackee.forkz.plist",
  ]
end
