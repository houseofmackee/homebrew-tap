cask "pasted" do
  version "0.3.2"
  sha256 "43ae77e2fa3a69333e8f1be63059d8c25f8144a2bb359c541b418909d77089e8"

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
