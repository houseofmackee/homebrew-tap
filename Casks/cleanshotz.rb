cask "cleanshotz" do
  version "0.7.0"
  sha256 "a0f34bf74200bb782b4f506b10eb12271f9d0cf1369db045cb4c7896c4f3afe1"

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
