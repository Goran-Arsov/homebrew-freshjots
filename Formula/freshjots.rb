# Homebrew formula for the Fresh Jots CLI.
#
# Homebrew tap. It does not work as-is until you:
#
#   1. Create a `homebrew-freshjots` repo (e.g. github.com/Goran-Arsov/homebrew-freshjots)
#   2. Tag a release of this CLI (e.g. v0.1.0) and publish a tarball
#   3. Update the `url` and `sha256` below to point at that release
#   4. Commit this file as `Formula/freshjots.rb` inside the tap repo
#
# Once published, users install with:
#   brew install Goran-Arsov/freshjots/freshjots
#
# Until the tap is set up, ship via curl|sh — see ../README.md.
class Freshjots < Formula
  desc "Command-line client for Fresh Jots"
  homepage "https://freshjots.com"
  # Replace before publishing:
  url "https://freshjots.com/cli/freshjots"
  # url "https://github.com/Goran-Arsov/freshjots-cli/archive/refs/tags/v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "ebb013891437db6ead5e165f40e409783a16e439f827891b1c479d8ee700bb25"
  license "MIT"

  depends_on "jq"

  def install
    bin.install "freshjots"
  end

  test do
    assert_match "freshjots #{version}", shell_output("#{bin}/freshjots version")
  end
end
