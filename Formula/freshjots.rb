# Homebrew formula for the Fresh Jots CLI.
#
# This is a snapshot of the formula currently published in the tap repo at
# github.com/Goran-Arsov/homebrew-freshjots. Keep them in sync — when you
# bump VERSION in public/cli/freshjots, recompute the sha256 below and
# also push the same change to the tap repo. See ../README.md for the
# full release process.
class Freshjots < Formula
  desc "Command-line client for Fresh Jots"
  homepage "https://freshjots.com"
  url "https://freshjots.com/cli/freshjots"
  version "0.1.0"
  sha256 "4e8e3726224ae4084185aa03fad64cc7a90fc34af25c748a68754013f7400130"
  license "MIT"

  depends_on "jq"

  def install
    bin.install "freshjots"
  end

  def caveats
    <<~EOS
      Set up your API token to start using freshjots:

        1. Mint a token at https://freshjots.com/settings/api_tokens
           (account must be on Dev or Dev-pro tier — see /pricing)

        2. Add to your shell rc (replace <paste-token-here>):
             echo "export FRESHJOTS_TOKEN='<paste-token-here>'" >> ~/.zshrc
           Then:
             source ~/.zshrc

        3. Smoke-test:
             freshjots ls
             freshjots append cli-test "hello from $(hostname)"
             freshjots cat cli-test
    EOS
  end

  test do
    assert_match "freshjots #{version}", shell_output("#{bin}/freshjots version")
  end
end
