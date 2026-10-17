cask "supertitle-cuer" do
  arch arm: "arm64", intel: "x64"

  version "2.7.3"
  sha256 arm:   "6e59b4849ed9a02651ae06614707ee6769ee83d48a8dc61f9d6bb49eabf63431",
         intel: "9fc43943d44b05b244a8d21a597ea065c3548afd78c2916a7ef73a849063eb00"

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
