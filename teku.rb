class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://bintray.com/consensys/pegasys-repo/download_file?file_path=teku-0.12.14.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "6499ae9520c2f128b92043db9520b0203dc0c7c1763dd50d965c103df0684c3a"

  depends_on :java => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
