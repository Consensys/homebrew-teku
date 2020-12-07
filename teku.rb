class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://bintray.com/consensys/pegasys-repo/download_file?file_path=teku-20.12.0.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "95d1ad3f7de3e4b50da042c2fca9e91e60094f980230e84dbd66fc20e5ddb9ac"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
