class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://bintray.com/consensys/pegasys-repo/download_file?file_path=teku-21.1.1.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "fe21aa1d2d2ec13b5b6b6db259be77fbf5a5fe70cdbf7f77c961e6b4e530761f"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
