class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/21.4.0/teku-21.4.0.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "2fd0731ca2bc524a3c26f83d3d4d27a1fb3ef2d5959b0f45d935fde2876e3149"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
