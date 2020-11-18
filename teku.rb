class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://bintray.com/consensys/pegasys-repo/download_file?file_path=teku-20.11.0-RC1.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "ff9e9753990d159002c39bb136cceb32a1b4d502eb440dcd829ffe589962c552"

  depends_on :java => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
