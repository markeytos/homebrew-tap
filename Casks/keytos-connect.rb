cask "keytos-connect" do
  version "1.0.17"                       # bump per release (matches deploy.yml input)
  sha256 "aa8066423b360a7d07dc13fd74008bde048a37969939afc657b66296576a83bf"

  url "https://download.keytos.io/keytos-connect/main/Apple/KeytosConnect.dmg"
  name "Keytos Connect"
  desc "Keytos Connect client"
  homepage "https://www.keytos.io/"

  depends_on macos: :ventura        # product_definition.plist sets min macOS 13.0

  app "Keytos Connect.app"               # CFBundleName / app bundle inside the DMG

  # Version bumps are pushed by the prod-homebrew CI job (step 5), so no livecheck is required.
  zap trash: [
    "~/Library/Application Support/com.keytos.connect",
    "~/Library/Preferences/com.keytos.connect.plist",
    "~/Library/Caches/com.keytos.connect",
    "~/Library/LaunchAgents/com.keytos.connect.background.plist",
  ]
end
