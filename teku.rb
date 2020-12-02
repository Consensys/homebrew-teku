class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://bintray.com/consensys/pegasys-repo/download_file?file_path=teku-20.11.1.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "07c547f79cf8502ebed0469440ea2c577e420dbb0a374a7ff2680fff38e34be4"

  depends_on :openjdk => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
