cask "supertitle-cuer" do
  arch arm: "arm64", intel: "x64"

  version "1.2.1"
  sha256 arm:   "089d5a56e60143cdf689c574ca09afd3eeb7090a3b76578185399e5805f82e3d",
         intel: "c5d8536582ae7ecc8fd657b1bd4762ec370d8137c9cb93ac51d9f31f0a19c6fa"

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
