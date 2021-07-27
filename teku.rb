class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/21.7.0/teku-21.7.0.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "0f20f46274a15156a3e36c0c2108b747817e2ff2f3887d0d7b9148fe990d4616"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
