class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/21.4.1/teku-21.4.1.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "b80750242549571ab2498a7ad49dc2080a5047548d8b6e20a05718af6f9749c3"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
