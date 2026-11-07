#!/bin/bash
# Points Formula/pikap.rb at pikap's latest GitHub release.
set -euo pipefail
tag=$(gh release view --repo ozangencer/pikap --json tagName -q .tagName)
version=${tag#v}
asset="pikap-$tag-macos.tar.gz"
sha=$(gh release download "$tag" --repo ozangencer/pikap --pattern "$asset.sha256" --output - | cut -d' ' -f1)
cat > Formula/pikap.rb <<RUBY
class Pikap < Formula
  desc "Terminal remote for Spotify and YouTube Music: cover art, synced lyrics"
  homepage "https://github.com/ozangencer/pikap"
  url "https://github.com/ozangencer/pikap/releases/download/$tag/$asset"
  version "$version"
  sha256 "$sha"
  license "MIT"

  depends_on :macos

  def install
    bin.install "pikap"
  end

  def caveats
    <<~EOS
      Spotify: run \`pikap auth spotify\` once; it walks you through connecting
      your account.

      YouTube Music works signed out and plays through mpv:
        brew install mpv yt-dlp
        pikap --backend ytmusic
      To bring in your liked songs and playlists: \`pikap auth ytmusic\`

      \`g S\` switches between the two while pikap runs.
    EOS
  end

  test do
    assert_match "pikap #{version}", shell_output("#{bin}/pikap --version")
  end
end
RUBY
echo "pikap $version ($sha)"
