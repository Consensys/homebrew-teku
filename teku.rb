class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/22.5.0/teku-22.5.0.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "f424d348e90c0c2a9d7f8576f2f2e39f1dd48e81a71bbb6b5598969bcd61b2db"
  head "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/develop/teku-develop.zip"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"

    (buildpath/"teku.yaml").write <<~EOS
      # Default Homebrew Teku config
      network: "mainnet"
      data-path: "#{etc}/teku.yaml"
    EOS
    etc.install "teku.yaml"
  end

  def post_install
    # Make sure the var/teku directory exists
    (var/"teku").mkpath
  end

  service do
    run [opt_bin/"teku", "--config-file=#{etc}/teku.yaml"]
    keep_alive true
    working_dir var/"teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
