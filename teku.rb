class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/21.12.0/teku-21.12.0.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "cce29aa95bd510ee1d1b843afaea3b0fc03213616281b0e70223cd1d35e040dd"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
