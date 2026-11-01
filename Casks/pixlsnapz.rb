cask "pixlsnapz" do
  version "0.3.0"
  sha256 "d0b8a95822dedfc6c746b2c28c3538767e4095800b531dabd0c957ec695c613f"

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
