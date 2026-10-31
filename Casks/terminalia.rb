cask "terminalia" do
  version "1.5.1"
  sha256 "c2c9289d9783c29d08a5df6e2b98355a90fd3cb49f2157394bf6cdc6564726d2"

  url "https://terminalia.dev/downloads/Terminalia-#{version}.dmg"
  name "Terminalia"
  desc "Native SSH client with terminal, SFTP, tunnels and process panels"
  homepage "https://terminalia.dev"

  livecheck do
    url "https://terminalia.dev/appcast.xml"
    strategy :sparkle, &:short_version
  end

  # Desde 1.3.0 la app se actualiza sola con Sparkle. scripts/publish-update.sh descomenta esta línea
  # al publicar la primera versión con Sparkle, para que `brew upgrade` no compita con ella
  # (solo actualizará con --greedy).
  auto_updates true
  depends_on macos: :sonoma

  app "Terminalia.app"

  zap trash: [
    "~/Library/Application Support/Terminalia",
    "~/Library/Caches/com.aacdev.Terminalia",
    "~/Library/Caches/Terminalia",
    "~/Library/HTTPStorages/com.aacdev.Terminalia",
    "~/Library/Preferences/com.aacdev.Terminalia.plist",
    "~/Library/Saved Application State/com.aacdev.Terminalia.savedState",
    "~/Library/WebKit/com.aacdev.Terminalia",
  ]
end
