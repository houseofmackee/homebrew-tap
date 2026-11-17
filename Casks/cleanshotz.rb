cask "cleanshotz" do
  version "0.11.1"
  sha256 "31f01e862b7a25ad1bae3c43ea2fb307143b19deae7e0811c98a99343b620e9a"

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
