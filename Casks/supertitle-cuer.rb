cask "supertitle-cuer" do
  arch arm: "arm64", intel: "x64"

  version "2.7.4"
  sha256 arm:   "f723494301f7dc65f734baf5007b503d10b15127084955cda0cc37b54af2d17a",
         intel: "c2ba07d8409e46d9383516238c5b228f9ef2f46c5f3a8d434cb5e94f47a94b55"

  url "https://github.com/Poetic-PiXie/supertitle-cuer/releases/download/v#{version}/Supertitle_Cuer-#{version}-#{arch}.dmg"
  name "Supertitle Cuer"
  desc "Cue opera supertitles from the score and run them to a projector"
  homepage "https://github.com/Poetic-PiXie/supertitle-cuer"

  depends_on macos: ">= :monterey"

  app "Supertitle Cuer.app"

  # The app has no Apple Developer ID signature; clear the download quarantine
  # so macOS lets it open (runs after every install and upgrade).
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Supertitle Cuer.app"]
  end

  # STQ keeps running in the Dock when its window is closed, so quit it before an upgrade
  # or uninstall: the new version must never start from a half-replaced app.
  uninstall quit: "com.poeticpixie.supertitlecuer"

  zap trash: [
    "~/Library/Application Support/Supertitle Cuer",
    "~/Library/Preferences/com.poeticpixie.supertitlecuer.plist",
    "~/Library/Saved Application State/com.poeticpixie.supertitlecuer.savedState",
  ]
end
