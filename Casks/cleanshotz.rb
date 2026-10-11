cask "cleanshotz" do
  version "0.6.0"
  sha256 "7416fbb5fb8f6b23b91f0a45d1caac92ae2ea6ffb313e3f760059c81033ed32b"

  url "https://github.com/houseofmackee/cleanshotz/releases/download/v#{version}/CleanShotZ-#{version}.dmg"
  name "CleanShotZ"
  desc "Screenshots, screen recordings and annotations"
  homepage "https://github.com/houseofmackee/cleanshotz"

  livecheck do
    url "https://github.com/houseofmackee/cleanshotz.git"
    strategy :git
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

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
