class Pikap < Formula
  desc "Spotify remote for the terminal: album art, synced lyrics, a turning record"
  homepage "https://github.com/ozangencer/pikap"
  url "https://github.com/ozangencer/pikap/releases/download/v0.1.4/pikap-v0.1.4-macos.tar.gz"
  version "0.1.4"
  sha256 "a98728395c223ad38e6d3d890ce438edb80ddde23f6644e59e9ecd20ff2b4f32"
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
