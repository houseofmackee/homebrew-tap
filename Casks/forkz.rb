cask "forkz" do
  version "0.14.0"
  sha256 "52f74278ad2a8354763358252147e106ebbcd13eead7301a8db6cf9817b1518e"

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
