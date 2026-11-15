cask "deeraw" do
  version "0.10.5"
  sha256 "26f2e8da102cc688ec340ec14f93fdab368b238c1752da505cb53e8f6af66d66"

  url "https://github.com/briedis/deeraw/releases/download/v#{version}/deeraw-macos-universal.zip"
  name "Deeraw"
  desc "Opinionated drawing app"
  homepage "https://github.com/briedis/deeraw"

  depends_on :macos

  # Includes the menu bar launcher (Contents/Library/LoginItems), which Deeraw starts.
  app "Deeraw.app"

  # Only ad-hoc signed (not notarised), so Gatekeeper would refuse to open the downloaded app.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Deeraw.app"]
  end

  uninstall quit: ["com.briedis.deeraw", "com.briedis.deeraw.launcher"]

  zap trash: "~/Library/Application Support/Deeraw"
end
