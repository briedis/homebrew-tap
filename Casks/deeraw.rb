cask "deeraw" do
  version "0.10.3"
  sha256 "8d5ec610322c9262e62eb6efde7ab2ad763ed378a9ba9c65e3b0b7fef3be2038"

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
