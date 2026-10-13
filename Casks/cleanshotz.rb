cask "cleanshotz" do
  version "0.8.1"
  sha256 "ad875bdac187fe0ad79b8b0a205780928dd05e57f1502ae7d0abd6829d6c73b7"

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
