cask "supertitle-cuer" do
  arch arm: "arm64", intel: "x64"

  version "2.7.5"
  sha256 arm:   "71e6f0bf2fbd6ca92e228f59e65e7882c6d3eba9a7e772bf550a6205dcb2aa3f",
         intel: "2a57a0e392c7a376973cf7392fae50dfb63a0fd0c1e32e6d23848fc96aa41de1"

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
