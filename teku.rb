class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/24.10.0/teku-24.10.0.zip"
  # update with: ./updateTeku.sh <new-version>
  sha256 "67ef7e1aa4dc138c526d8ac7230c965157032a579a98767b22aba8e8db1662ff"
  head "https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/develop/teku-develop.zip"

  depends_on "openjdk" => "17+"

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
