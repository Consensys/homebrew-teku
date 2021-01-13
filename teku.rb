class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://bintray.com/consensys/pegasys-repo/download_file?file_path=teku-21.1.0.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "a96216df8b61a38ff98b0351565f63bb00f2d0b8d516fdfaaedb750cdfe45a14"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
