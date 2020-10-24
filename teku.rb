class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://bintray.com/consensys/pegasys-repo/download_file?file_path=teku-0.12.11.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "71c83f431d1732bda74ff74d40aac091a93d8d22cb170125005c00058f6ad95f"

  depends_on :java => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
