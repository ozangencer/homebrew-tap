class Pikap < Formula
  desc "Spotify remote for the terminal: album art, synced lyrics, a turning record"
  homepage "https://github.com/ozangencer/pikap"
  url "https://github.com/ozangencer/pikap/releases/download/v0.1.0/pikap-v0.1.0-macos.tar.gz"
  version "0.1.0"
  sha256 "b175ad4899afc1e0533ae63931b70d182bbf103551d345effcee58ebe30a34c8"
  license "MIT"

  depends_on :macos

  def install
    bin.install "pikap"
  end

  def caveats
    <<~EOS
      Run `pikap auth` once: it walks you through connecting your Spotify account.
    EOS
  end

  test do
    assert_match "pikap #{version}", shell_output("#{bin}/pikap --version")
  end
end
