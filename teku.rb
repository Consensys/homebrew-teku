class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/21.11.1/teku-21.11.1.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "46b529802c1cd7faee6d74a127a2bad20dbf677f15f5eb0bb3fe021572a190eb"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
