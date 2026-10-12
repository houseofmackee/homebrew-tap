cask "cleanshotz" do
  version "0.8.0"
  sha256 "fd0dbb34dd645f640487605dbceeb8e918f51b36ddc1c398106509cb1bb4951c"

  url "https://github.com/houseofmackee/cleanshotz/releases/download/v#{version}/CleanShotZ-#{version}.dmg"
  name "CleanShotZ"
  desc "Screenshots, screen recordings and annotations"
  homepage "https://github.com/houseofmackee/cleanshotz"

  livecheck do
    url "https://github.com/houseofmackee/cleanshotz.git"
    strategy :git
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "CleanShotZ.app"
  binary "#{appdir}/CleanShotZ.app/Contents/MacOS/cleanshotz"

  uninstall quit: "io.github.houseofmackee.cleanshotz"

  zap trash: [
    "~/Library/Application Support/CleanShotZ",
    "~/Library/Caches/CleanShotZ",
    "~/Library/Caches/io.github.houseofmackee.cleanshotz",
    "~/Library/HTTPStorages/io.github.houseofmackee.cleanshotz",
    "~/Library/Logs/CleanShotZ",
    "~/Library/Preferences/io.github.houseofmackee.cleanshotz.plist",
  ]
end
