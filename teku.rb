class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/21.8.2/teku-21.8.2.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "16dce597c9b17c8e82cedf0870ea682e47c74d3262cb02b4e83a54ec5620bb52"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
