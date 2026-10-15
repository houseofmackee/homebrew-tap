cask "pasted" do
  version "0.3.3"
  sha256 "2c53a7ba7325f75fb11315a12aff5e00c18d523d24ad23cd897dbe11eed03696"

  url "https://github.com/houseofmackee/pasted/releases/download/v#{version}/Pasted-#{version}-arm64.dmg"
  name "Pasted"
  desc "Clipboard history with pinboards, search and snippets"
  homepage "https://github.com/houseofmackee/pasted"

  livecheck do
    url "https://github.com/houseofmackee/pasted.git"
    strategy :git
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Pasted.app"
  binary "#{appdir}/Pasted.app/Contents/MacOS/pasted"

  uninstall quit: "io.github.houseofmackee.pasted"

  zap trash: [
    "~/Library/Application Support/Pasted",
    "~/Library/Caches/io.github.houseofmackee.pasted",
    "~/Library/HTTPStorages/io.github.houseofmackee.pasted",
    "~/Library/Preferences/io.github.houseofmackee.pasted.plist",
  ]
end
