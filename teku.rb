class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/21.5.0/teku-21.5.0.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "a3dd453a7d149849618fa9edc57f96f3f8b02a9ae3949f08f0dddce98e2d5b67"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
