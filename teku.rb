class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/21.8.0/teku-21.8.0.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "af64aded12d2cb757fe190280d7a8f0ef59b8982ca474d46d99175f7e1859c43"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
