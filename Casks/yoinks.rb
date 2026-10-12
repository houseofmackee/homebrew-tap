cask "yoinks" do
  version "0.4.0"
  sha256 "dee834d3ddf6cf286a1865bcf93150a67fcf2396e599eef2fbbed604330b9f5c"

  url "https://github.com/houseofmackee/yoinks/releases/download/v#{version}/Yoinks-#{version}.dmg"
  name "Yoinks"
  desc "Drag-and-drop shelf and clipboard history"
  homepage "https://github.com/houseofmackee/yoinks"

  livecheck do
    url "https://github.com/houseofmackee/yoinks.git"
    strategy :git
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Yoinks.app"
  binary "#{appdir}/Yoinks.app/Contents/MacOS/yoinks"

  uninstall quit: "io.github.yoinks"

  zap trash: [
    "~/Library/Application Support/Yoinks",
    "~/Library/Caches/io.github.yoinks",
    "~/Library/HTTPStorages/io.github.yoinks",
    "~/Library/Preferences/io.github.yoinks.plist",
    "~/Library/WebKit/io.github.yoinks",
  ]
end
