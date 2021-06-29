class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/21.6.1/teku-21.6.1.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "30e5003f98108ffe68d6239a35daae36c3ea4b5ddaa3d254087e694234de7665"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
