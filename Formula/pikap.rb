class Pikap < Formula
  desc "Spotify remote for the terminal: album art, synced lyrics, a turning record"
  homepage "https://github.com/ozangencer/pikap"
  url "https://github.com/ozangencer/pikap/releases/download/v0.1.2/pikap-v0.1.2-macos.tar.gz"
  version "0.1.2"
  sha256 "fcc4a31a4be6be71db2c8dbfb8358caa75b18c90f5d8d13d4a11cc64cb8166b4"
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
