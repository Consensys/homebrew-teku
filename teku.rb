class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://bintray.com/consensys/pegasys-repo/download_file?file_path=teku-20.12.1.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "09d2d77ce81c76bbe71727ff57a5d7a6e517fe99a8d837304f6ff10702c7330c"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
