cask "deeraw" do
  version "0.7.0"
  sha256 "7f2ec7e74699d2b9dbe8a02fa3fb604e6e4e4a6ddb841ddce15f349c46a8a9b8"

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
