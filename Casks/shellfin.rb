cask "shellfin" do
  version "0.2.0"
  sha256 "854f4055ad0016a2729d19fcb4bf4357a7005de46c152583f8079979b58551e6"

  url "https://github.com/shellfin-app/shellfin/releases/download/v#{version}/Shellfin_#{version}_aarch64.dmg"
  name "Shellfin"
  desc "Cross-platform SSH client with terminals, SFTP file tree and editor"
  homepage "https://shellfin.app/"

  livecheck do
    skip "Updated by the release workflow of the project"
  end

  auto_updates true
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
