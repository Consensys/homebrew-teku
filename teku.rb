class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/21.11.0/teku-21.11.0.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "fee5edd693635bfc05ad7c7ae1d722c951ac5e5fddfbcc6b2639209a080e409a"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
