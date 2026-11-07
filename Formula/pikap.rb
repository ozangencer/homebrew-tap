class Pikap < Formula
  desc "Terminal remote for Spotify and YouTube Music: cover art, synced lyrics"
  homepage "https://github.com/ozangencer/pikap"
  url "https://github.com/ozangencer/pikap/releases/download/v0.2.1/pikap-v0.2.1-macos.tar.gz"
  version "0.2.1"
  sha256 "ce420aea74ccfad7ac7dd047b1a655f0d212695760bd41ddf897f501447afa44"
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
