cask "deeraw" do
  version "0.3.0"
  sha256 "d594c8302d9c5568e3af2526989c5bb044fae8642c1a735f8034f88c60cd8937"

  url "https://github.com/briedis/deeraw/releases/download/v#{version}/deeraw-macos-universal.zip"
  name "Deeraw"
  desc "Opinionated drawing app"
  homepage "https://github.com/briedis/deeraw"

  depends_on :macos

  app "Deeraw.app"
  # Menu bar icon that opens Deeraw (it registers itself as a login item on first launch).
  app "Deeraw Launcher.app"

  # Only ad-hoc signed (not notarised), so Gatekeeper would refuse to open the downloaded apps.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Deeraw.app"]
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Deeraw Launcher.app"]
  end

  uninstall quit: ["com.briedis.deeraw", "com.briedis.deeraw.launcher"]

  zap trash: "~/Library/Application Support/Deeraw"
end
