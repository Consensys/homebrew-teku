class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/21.12.1/teku-21.12.1.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "977bba9f52ddf96bccdc4af7c1efef94fcbd166b19f9b8babbac5afecac4807a"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
