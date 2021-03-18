class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/21.3.0/teku-21.3.0.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "4f29f5784b2aa31e5a36232134625ccbc445f0d187af77dbcb4bbf5327522fef"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
