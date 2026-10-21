#!/bin/bash
# Points Formula/pikap.rb at pikap's latest GitHub release.
set -euo pipefail
tag=$(gh release view --repo ozangencer/pikap --json tagName -q .tagName)
version=${tag#v}
asset="pikap-$tag-macos.tar.gz"
sha=$(gh release download "$tag" --repo ozangencer/pikap --pattern "$asset.sha256" --output - | cut -d' ' -f1)
cat > Formula/pikap.rb <<RUBY
class Pikap < Formula
  desc "Spotify remote for the terminal: album art, synced lyrics, a turning record"
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
      Run \`pikap auth\` once: it walks you through connecting your Spotify account.
    EOS
  end

  test do
    assert_match "pikap #{version}", shell_output("#{bin}/pikap --version")
  end
end
RUBY
echo "pikap $version ($sha)"
