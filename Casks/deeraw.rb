cask "deeraw" do
  version "0.10.0"
  sha256 "18382a0c99cc7eb07217fab3ca2386f3c2a3f70bc7c7c30b8ff2a31fc2a6eeab"

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
