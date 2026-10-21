class Pikap < Formula
  desc "Spotify remote for the terminal: album art, synced lyrics, a turning record"
  homepage "https://github.com/ozangencer/pikap"
  url "https://github.com/ozangencer/pikap/releases/download/v0.1.1/pikap-v0.1.1-macos.tar.gz"
  version "0.1.1"
  sha256 "37866fb38c4e57a6adc08bcc9e3d2004e19c0599f95b035df19b969a5a68a726"
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
