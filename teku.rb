class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://bintray.com/consensys/pegasys-repo/download_file?file_path=teku-0.12.13.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "bc123358eeebfb38308ecc0c7b15d5ed33b7cfcc558664bef883eb909c451aa1"

  depends_on :java => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
