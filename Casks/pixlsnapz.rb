cask "pixlsnapz" do
  version "0.3.2"
  sha256 "c38bbe0296062673cc1f2c7e63d6d91f42dbf5dadac7d82d1ddf07a951fbd6a7"

  url "https://github.com/houseofmackee/pixlsnapz/releases/download/v#{version}/PixlSnapz-#{version}-arm64.dmg"
  name "PixlSnapz"
  desc "Screen ruler for measuring anything on screen"
  homepage "https://github.com/houseofmackee/pixlsnapz"

  livecheck do
    url "https://github.com/houseofmackee/pixlsnapz.git"
    strategy :git
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "PixlSnapz.app"
  binary "#{appdir}/PixlSnapz.app/Contents/MacOS/pixlsnapz"

  uninstall quit: "io.github.houseofmackee.pixlsnapz"

  zap trash: [
    "~/Library/Application Support/PixlSnapz",
    "~/Library/Caches/io.github.houseofmackee.pixlsnapz",
    "~/Library/HTTPStorages/io.github.houseofmackee.pixlsnapz",
    "~/Library/Preferences/io.github.houseofmackee.pixlsnapz.plist",
  ]
end
