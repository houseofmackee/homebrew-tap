cask "pasted" do
  version "0.3.4"
  sha256 "f38f3c36ae2e4dd5b4b764a2543f8951af98feeb7ecc21e61e753d97e6cb0abe"

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
