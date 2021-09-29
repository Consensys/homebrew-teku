class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/21.9.2/teku-21.9.2.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "abc18835be9a645b4d7d3fff5cc9a589b4a0f5386c7de0c49f325f98eeafcf30"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
