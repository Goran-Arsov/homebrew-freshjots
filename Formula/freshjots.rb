class Freshjots < Formula
  desc "Command-line client for Fresh Jots"
  homepage "https://freshjots.com"
  url "https://freshjots.com/cli/1.1.0/freshjots"
  sha256 "f27b045dc3b302d5e2746a76a1da03d6a7e6699b320b01b1ec1318a62d65cc8d"
  license "MIT"

  livecheck do
    url "https://freshjots.com/cli/latest-version.txt"
    regex(/(\d+(?:\.\d+)+)/i)
  end

  depends_on "jq"

  def install
    bin.install "freshjots"
  end

  def caveats
    <<~EOS
      Set up your API token to start using freshjots:

        1. Mint a token at https://freshjots.com/settings/api_tokens
           (account must be on the Dev or Team tier — see /pricing)

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
