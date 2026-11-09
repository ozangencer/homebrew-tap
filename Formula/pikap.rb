class Pikap < Formula
  desc "Terminal remote for Spotify and YouTube Music: cover art, synced lyrics"
  homepage "https://github.com/ozangencer/pikap"
  url "https://github.com/ozangencer/pikap/releases/download/v0.2.2/pikap-v0.2.2-macos.tar.gz"
  version "0.2.2"
  sha256 "294b0344ce0f68b5010f0eb0970cf33582b33f55b27b40a281ba4fc54bab2556"
  license "MIT"

  depends_on :macos

  def install
    bin.install "pikap"
  end

  def caveats
    <<~EOS
      Spotify: run `pikap auth spotify` once; it walks you through connecting
      your account.

      YouTube Music works signed out and plays through mpv:
        brew install mpv yt-dlp
        pikap --backend ytmusic
      To bring in your liked songs and playlists: `pikap auth ytmusic`

      `g S` switches between the two while pikap runs.
    EOS
  end

  test do
    assert_match "pikap #{version}", shell_output("#{bin}/pikap --version")
  end
end
