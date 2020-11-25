class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://bintray.com/consensys/pegasys-repo/download_file?file_path=teku-20.11.0.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "1a4e86a75fe4c8bb6346eaf0443d54fb19d217cab8b8271570ee1007e741fcd9"

  depends_on :java => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
