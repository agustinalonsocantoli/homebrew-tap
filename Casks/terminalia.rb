cask "terminalia" do
  version "1.4.0"
  sha256 "eeb9fd6d585e9a791cb880dc243ba552f5235f40cc1c171b332678440f388a8f"

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
