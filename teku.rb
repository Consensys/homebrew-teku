class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/21.10.0/teku-21.10.0.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "a213e81bc5c0c44b74b8e055d78f75edf8684ed7b701ff61d1d80800ee6bb350"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
