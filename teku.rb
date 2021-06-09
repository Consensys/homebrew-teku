class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/21.6.0/teku-21.6.0.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "9f64d07007f462a4e74875d9104458b86958bd5c9cf09b965936d05f140b9c06"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
