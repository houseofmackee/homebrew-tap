cask "yoinks" do
  version "0.6.1"
  sha256 "65ca8e8d2393cea4128693daaec55c2038143cdf9dc1972e1854dc16bab1ca04"

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
