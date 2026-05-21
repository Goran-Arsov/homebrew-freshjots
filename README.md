# homebrew-freshjots

Homebrew tap for the [Fresh Jots](https://freshjots.com) CLI — a command-line
client for browsing and appending to your jots from the terminal.

## Install

```bash
brew tap Goran-Arsov/freshjots
brew install freshjots
```

This pulls the `freshjots` binary from <https://freshjots.com/cli/freshjots>
and also installs [`jq`](https://stedolan.github.io/jq/) if it isn't already
on your system.

## Set up your API token

The CLI talks to freshjots.com on your behalf, so it needs a token.

1. Mint one at <https://freshjots.com/settings/api_tokens>.
   Your account must be on a **Dev** or **Dev-pro** tier — see
   <https://freshjots.com/pricing>.

2. Add it to your shell rc (replace `<paste-token-here>`):

   ```bash
   echo "export FRESHJOTS_TOKEN='<paste-token-here>'" >> ~/.zshrc
   source ~/.zshrc # For Mac OS
   ```

   For bash (Linux), use `~/.bashrc` instead.

3. Smoke-test:

   ```bash
   freshjots ls
   freshjots append cli-test "hello from $(hostname)"
   freshjots cat cli-test
   ```

## Updating

```bash
brew update && brew upgrade freshjots
```

## Uninstalling

```bash
brew uninstall freshjots
brew untap Goran-Arsov/freshjots
```

Then remove the `FRESHJOTS_TOKEN` line from your shell rc.

## Links

- Web app & account: <https://freshjots.com>
- Pricing & tiers: <https://freshjots.com/pricing>
- API tokens: <https://freshjots.com/settings/api_tokens>
- Formula source: [`Formula/freshjots.rb`](Formula/freshjots.rb)
- License: [MIT](LICENSE)
