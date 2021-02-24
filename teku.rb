class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/21.2.0/teku-21.2.0.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "c68f553cd23ac457aff82f89bf17953dc11ea891ce4ed29436dbafb2d8ec6a85"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
