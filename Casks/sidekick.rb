cask "sidekick" do
  version "0.2.2"
  sha256 "1b29a814e578b4346584c7f31fdcc7e1da39a8f56c9fd85a7d8a02049335b0db"

  url "https://github.com/jonnilundy/sidekick/releases/download/v#{version}/Sidekick-#{version}.zip"
  name "Sidekick"
  desc "Quick-answer panel for the Claude Code CLI"
  homepage "https://github.com/jonnilundy/sidekick"

  livecheck do
    url "https://raw.githubusercontent.com/jonnilundy/sidekick/main/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Sidekick.app"

  # The app is ad hoc signed, not notarized. Without this, Gatekeeper blocks the first launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Sidekick.app"],
        writable_paths: ["Sidekick.app"],
        writable_base:  :appdir
  end

  uninstall quit: "com.jonnilundy.sidekick"

  zap trash: [
    "~/Library/Caches/com.jonnilundy.sidekick",
    "~/Library/HTTPStorages/com.jonnilundy.sidekick",
    "~/Library/Preferences/com.jonnilundy.sidekick.plist",
  ]

  caveats <<~EOS
    Sidekick needs Claude Code installed and logged in: `claude` must work in Terminal.
  EOS
end
