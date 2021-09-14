class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/21.9.0/teku-21.9.0.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "4d8ad9f35ec90c209ac2ad85a4d92e451139a3c911243a550edc66c2e219f6fd"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
