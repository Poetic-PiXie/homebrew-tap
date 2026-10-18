cask "supertitle-cuer" do
  arch arm: "arm64", intel: "x64"

  version "2.8.0"
  sha256 arm:   "085b5083de651aae1844bacfdc47368205ccb0ea3d11043156d68ab10a2cef80",
         intel: "38f44d229407c2094b92155408958c962c0c778a084fb7892ddab80a13ad1844"

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
