class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/21.8.1/teku-21.8.1.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "db693e374a823e7cf08e858d467f0801bf9e6af54bb3c334144a6f7a0103858c"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
