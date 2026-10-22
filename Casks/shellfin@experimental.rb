cask "shellfin@experimental" do
  version "0.2.0-experimental.1"
  sha256 "267931eaf09f4b512ecbed4a8f4de5ab439901ae83b77cc878f504abf7b3b4ca"

  url "https://github.com/shellfin-app/shellfin/releases/download/v#{version}/Shellfin_#{version}_aarch64.dmg"
  name "Shellfin"
  desc "Cross-platform SSH client with terminals, SFTP file tree and editor"
  homepage "https://shellfin.app/"

  livecheck do
    skip "Updated by the release workflow of the project"
  end

  auto_updates true
  conflicts_with cask: "shellfin"
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Shellfin.app"

  zap trash: [
    "~/Library/Application Support/app.shellfin.desktop",
    "~/Library/Caches/app.shellfin.desktop",
    "~/Library/HTTPStorages/app.shellfin.desktop",
    "~/Library/Logs/app.shellfin.desktop",
    "~/Library/Preferences/app.shellfin.desktop.plist",
    "~/Library/Saved Application State/app.shellfin.desktop.savedState",
    "~/Library/WebKit/app.shellfin.desktop",
  ]

  caveats <<~EOS
    Shellfin is not notarized by Apple yet, so macOS blocks the first launch.
    Open it once, then go to System Settings > Privacy & Security, scroll to the message about Shellfin and
    choose "Open Anyway".
  EOS
end
