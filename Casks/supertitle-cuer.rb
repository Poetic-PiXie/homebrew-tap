cask "supertitle-cuer" do
  arch arm: "arm64", intel: "x64"

  version "1.0.0"
  sha256 arm:   "7f19464676eafb0338d0bbaff79fb948adc5d1c6a04a1c7bd3d4c8189c701e6b",
         intel: "65cd48749658abc41ade342b9b724761d79abe80498841b67fd2a7ac7299ec88"

  url "https://github.com/Poetic-PiXie/supertitle-cuer/releases/download/v#{version}/Supertitle_Cuer-#{version}-#{arch}.dmg"
  name "Supertitle Cuer"
  desc "Cue opera supertitles from the score and run them to a projector"
  homepage "https://github.com/Poetic-PiXie/supertitle-cuer"

  depends_on macos: :monterey

  app "Supertitle Cuer.app"

  # The app has no Apple Developer ID signature; clear the download quarantine
  # so macOS lets it open (runs after every install and upgrade).
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Supertitle Cuer.app"]
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
