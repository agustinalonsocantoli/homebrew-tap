# homebrew-tap

Tap de Homebrew de [Terminalia](https://terminalia.dev), el cliente SSH nativo para Mac.

```bash
brew trust --cask agustinalonsocantoli/tap/terminalia && brew install --cask agustinalonsocantoli/tap/terminalia
```

Homebrew 7+ no carga casks de taps de terceros sin `brew trust`; por eso el comando confía primero solo en este cask (no en todo el tap).
Requiere macOS 14 (Sonoma) o posterior.

> Terminalia todavía no está notarizada por Apple. La primera vez que la abras, macOS la bloqueará:
> Ajustes del Sistema › Privacidad y seguridad › **Abrir igualmente** (una vez por versión).

Desde la 1.3.0 la app se actualiza sola (Sparkle). `brew upgrade` no la toca salvo con `--greedy`.

Desinstalar borrando también ajustes y cachés: `brew uninstall --zap --cask terminalia`
(los secretos del llavero de macOS no se borran; hazlo desde Acceso a Llaveros si quieres).

---

## Mantenimiento (solo para el autor)

### Crear el repositorio (una sola vez)

Homebrew exige que el repo se llame `homebrew-<nombre>`; `brew` lo abrevia a `<usuario>/<nombre>`.

1. En GitHub, crea el repo **público** `agustinalonsocantoli/homebrew-tap` (sin README ni licencia).
2. Desde esta carpeta:

   ```bash
   git init -b main
   git add .
   git commit -m "feat: cask terminalia 1.2.1"
   git remote add origin git@github.com:agustinalonsocantoli/homebrew-tap.git
   git push -u origin main
   ```

3. Prueba en limpio:

   ```bash
   brew trust --cask agustinalonsocantoli/tap/terminalia && brew install --cask agustinalonsocantoli/tap/terminalia
   brew audit --cask --online agustinalonsocantoli/tap/terminalia
   brew livecheck --cask agustinalonsocantoli/tap/terminalia
   ```

### Publicar una versión

No se edita a mano. `Terminalia/scripts/publish-update.sh` actualiza `version` y `sha256` de
`Casks/terminalia.rb` en el mismo paso que el appcast de Sparkle. Después:

```bash
git commit -am "chore: terminalia X.Y.Z" && git push
```

Publica el cask **después** de desplegar la web: la URL
`https://terminalia.dev/downloads/Terminalia-X.Y.Z.dmg` tiene que existir ya, o `brew install` fallará
por checksum/404.

### Rutas que borra `zap`

Salen del código de la app (`AppPaths`, bundle id `com.aacdev.Terminalia`, WKWebView de Monaco y Sparkle):

- `~/Library/Application Support/Terminalia` (perfiles, ajustes, sockets, askpass, Monaco)
- `~/Library/Caches/Terminalia` (descargas del editor) y `~/Library/Caches/com.aacdev.Terminalia` (Sparkle)
- `~/Library/HTTPStorages/com.aacdev.Terminalia`, `~/Library/WebKit/com.aacdev.Terminalia`
- `~/Library/Preferences/com.aacdev.Terminalia.plist`, `~/Library/Saved Application State/com.aacdev.Terminalia.savedState`
