cask "sidekick" do
  version "0.2.1"
  sha256 "539291419e7293b42d5cf18ec3c2cc52562c5967fedf04a0b8bb82cc3719e758"

  url "https://github.com/jonnilundy/sidekick/releases/download/v#{version}/Sidekick-#{version}.zip"
  name "Sidekick"
  desc "Quick-answer panel for the Claude Code CLI"
  homepage "https://github.com/jonnilundy/sidekick"

  livecheck do
    url "https://raw.githubusercontent.com/jonnilundy/sidekick/main/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: ">= :sequoia"

  app "Sidekick.app"

  # The app is ad hoc signed, not notarized. Without this, Gatekeeper blocks the first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Sidekick.app"]
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
