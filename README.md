# realskyrin Homebrew Tap

Personal Homebrew tap for [realskyrin](https://github.com/realskyrin)'s projects.

## Tap

```bash
brew tap realskyrin/tap
```

## Install

Formulae and casks in this tap can be installed with fully qualified names:

```bash
brew install realskyrin/tap/<formula>
brew install --cask realskyrin/tap/<cask>
```

After tapping the repository, short names also work when they do not conflict with other taps:

```bash
brew install <formula>
brew install --cask <cask>
```

## Casks

- `capcap` - lightweight native menu bar screenshot tool.
- `clipcap` - permission-light Mac image annotation tool.

## Maintainer Flow

Regenerate the capcap cask from the published GitHub Release asset checksum:

```bash
bash scripts/generate-capcap-cask.sh <version> <sha256>
ruby -c Casks/capcap.rb
brew audit --cask --strict --online realskyrin/tap/capcap

bash scripts/generate-clipcap-cask.sh <version> <sha256>
ruby -c Casks/clipcap.rb
brew audit --cask --strict --online realskyrin/tap/clipcap
```

The capcap release workflow can dispatch `capcap_release_published` with
`version` and `sha256` when its `HOMEBREW_TAP_TOKEN` secret is configured.
The clipcap release workflow uses `clipcap_release_published` with the same
payload shape.

## Update

```bash
brew update
brew upgrade
```

## Uninstall

```bash
brew uninstall <formula>
brew uninstall --cask <cask>
brew untap realskyrin/tap
```
