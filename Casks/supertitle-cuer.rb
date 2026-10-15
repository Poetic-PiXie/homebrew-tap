cask "supertitle-cuer" do
  arch arm: "arm64", intel: "x64"

  version "2.2.4"
  sha256 arm:   "b42165bc1ac9765bd39dd24904fe09c4bb23061f589ce1ba4f716a9c3a9377b3",
         intel: "84b25991929c644965864fa43f7b53b89ad403c192f54b143ae2b6ea1d81a615"

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

  zap trash: [
    "~/Library/Application Support/Supertitle Cuer",
    "~/Library/Preferences/com.poeticpixie.supertitlecuer.plist",
    "~/Library/Saved Application State/com.poeticpixie.supertitlecuer.savedState",
  ]
end
