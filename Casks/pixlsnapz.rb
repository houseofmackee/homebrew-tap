cask "pixlsnapz" do
  version "0.1.1"
  sha256 "de924ebb875fad8621e037a07c871c2eadb172c1e5623d5caaf09636fd030abf"

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
