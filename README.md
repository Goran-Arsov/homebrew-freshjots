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
   Your account must be on the **Pro** or **Team** tier — see
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

## Commands

The CLI covers reading, writing, and organizing notes:

```bash
# Read
freshjots ls                            # "<id>\t<filename>\t<title>" per row
freshjots ls -n 10 --sort created       # last 10 by creation (--sort created|updated|appended)
freshjots ls --folder Work              # filter by folder id or name; --root for un-foldered
freshjots ls --all -l                   # every page, long format (id, updated, lock, folder, …)
freshjots get 42                        # full note as JSON (metadata)
freshjots cat cron-jobs-prod            # note body, by id or filename
freshjots folders                       # "<id>\t<name>" per row
freshjots folder 3                      # one folder as JSON

# Write
freshjots create "Research 2026 Q2"     # new note by title (body from stdin or --body)
freshjots append cron-jobs-prod "ok"    # append to a stream; creates it on first use
freshjots update 42 --title T --body B  # edit a note by id
freshjots set cron-jobs-prod --body B   # same edit, addressed by filename
freshjots rm cron-jobs-prod             # delete by id or filename
freshjots bulk notes.json               # create up to 50 notes atomically (or: … | freshjots bulk -)

# Organize
freshjots mv cron-jobs-prod Work        # move into a folder (id or name); --root to un-folder
freshjots folder create Work            # create a folder
freshjots folder rename 3 Archive       # rename a folder
freshjots folder rm 3                   # delete a folder

# Meta
freshjots api-reference                 # print the authoritative API reference
freshjots version                       # print version (run 'freshjots help' for full usage)
```

`create`, `append`, `bulk`, and `update`/`set` with `-` read from stdin, so the
usual pipe patterns work:

```bash
backup.sh && echo "backup ok $(date -Iseconds)" | freshjots append cron-jobs-prod
git log -1 --pretty=format:"%h %s" | freshjots append deploys
```

`update` and `set` change only the flags you pass — content (`--title`,
`--body`, or `-` to read the body from stdin) or metadata (`--folder`/`--root`,
`--deadline`, `--alert-email`, `--webhook-url`, `--webhook-secret`).

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
