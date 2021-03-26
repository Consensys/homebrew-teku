class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/21.3.2/teku-21.3.2.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "54a5b1790d65e4c7c8c0898ef87aab1e201c524511ec03f75d804f380e6a096f"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
