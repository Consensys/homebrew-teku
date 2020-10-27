class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://bintray.com/consensys/pegasys-repo/download_file?file_path=teku-0.12.12.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "8a9e7f17974d5040522106d0f4a8016a9ce7cfe5432f5a72ddc23b46a35654bb"

  depends_on :java => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
