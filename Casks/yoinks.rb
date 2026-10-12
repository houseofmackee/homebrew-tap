cask "yoinks" do
  version "0.6.0"
  sha256 "4cce59c54ad46e4b7ba6164fc667fc8a2d0a799cddfa867cb69297934bd19aa1"

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
