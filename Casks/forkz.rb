cask "forkz" do
  version "0.21.1"
  sha256 "ec7916306fe8228672f2536732ee57b6d8e5c0c9116b5872c63b23b02870a418"

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
