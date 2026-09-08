# Katta: the secure and easy way to work in teams

Katta brings zero-config storage management and zero-knowledge key management for teams and organizations.

## Katta Admin CLI Homebrew Tap

[Homebrew](https://brew.sh) tap for the **Katta Admin CLI** (`katta`) — the tool used to
configure a Katta Server including its S3 storage backend.

The formula in [`Formula/katta.rb`](Formula/katta.rb) is rendered and pushed automatically
by the [`cli.yml`](https://github.com/shift7-ch/katta-clientlib/blob/main/.github/workflows/cli.yml)
workflow in [`shift7-ch/katta-clientlib`](https://github.com/shift7-ch/katta-clientlib) on
every tagged release, pinned to that release's macOS arm64 tarball and its `sha256`.

> **Requirements:** macOS on Apple Silicon (arm64). The native image is not built for
> Intel Macs. On Linux, install the `.deb` / `.rpm` package or the standalone binary from
> the [GitHub Releases](https://github.com/shift7-ch/katta-clientlib/releases) instead.

## Install

```bash
brew tap shift7-ch/katta
brew trust --formula shift7-ch/katta/katta
brew install katta
```

`brew tap shift7-ch/katta` registers this repository (`github.com/shift7-ch/homebrew-katta`)
as a formula source; the short name `shift7-ch/katta` is resolved to it. After tapping,
`katta` behaves like any other formula.

`brew trust` is required on recent Homebrew versions before a third-party tap's
formula will load — otherwise `brew install` fails with *"Refusing to load formula
… from untrusted tap"*. `--formula shift7-ch/katta/katta` trusts only this formula
and the trust persists across CI updates. To trust every current and future
formula from the tap instead, run `brew trust shift7-ch/katta`. See
[docs.brew.sh/Tap-Trust](https://docs.brew.sh/Tap-Trust).

Formulae rendered by CI also install bash completion (via `katta completion --shell bash`).

## Upgrade

```bash
brew update
brew upgrade katta
```

## Uninstall

```bash
brew uninstall katta
brew untrust --formula shift7-ch/katta/katta
brew untap shift7-ch/katta
```

## Verify

```bash
katta --help
```

## Usage

See the [Admin CLI README](https://github.com/shift7-ch/katta-clientlib/blob/main/admin-cli/README.md)
for `setup`, `storageprofile`, and `completion` command documentation.
