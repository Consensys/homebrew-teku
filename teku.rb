class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/21.10.1/teku-21.10.1.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "39901925cbeb34e5ba9c23cdfe018b2b2bba701c5a7f0add5639e120db8745b1"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
