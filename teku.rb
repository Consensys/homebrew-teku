class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/21.12.2/teku-21.12.2.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "0c8adbc974b2238f721fe9231ef17291c6203034f10514d581f1eb4421046f5e"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
