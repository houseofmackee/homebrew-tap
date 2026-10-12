cask "yoinks" do
  version "0.5.0"
  sha256 "9e7fe5d9daf3f6eb9170cd0587a46e4534692cf8018a89c0deedfce94789ba91"

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
