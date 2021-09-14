class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/21.9.1/teku-21.9.1.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "1217a6cef7a682996dceb8b8613680f65411fc4123bea41f6dfa66dfd97cac82"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
