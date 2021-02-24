#!/bin/bash
set -euo pipefail
TEMP=`mktemp -d`

function cleanup() {
	rm -rf "${TEMP}"
}
trap cleanup EXIT

VERSION=${1?Must specify the Teku version to get}
URL="https://artifacts.consensys.net/public/teku/raw/names/teku.zip/versions/${VERSION}/teku-${VERSION}.zip"
echo "Downloading version ${VERSION} of Teku from ${URL}..."
curl -o "${TEMP}/teku-${VERSION}.zip" -L --fail "${URL}"

unzip -t "${TEMP}/teku-${VERSION}.zip"

echo "Calculating new hash..."
HASH=`shasum -a 256 ${TEMP}/teku-${VERSION}.zip | cut -d ' ' -f 1`

cat > teku.rb <<EOF
class Teku < Formula
  desc "Teku Ethereum 2 beacon chain client"
  homepage "https://github.com/consensys/teku"
  url "${URL}"
  # update with: ./updateTeku.sh <new-version>
  sha256 "${HASH}"

  depends_on "openjdk" => "11+"

  def install
    cp_r ".", "#{prefix}/dist"
    bin.install_symlink "#{prefix}/dist/bin/teku"
  end

  test do
    system "#{bin}/teku" "--version"
  end
end
EOF

echo "New url: ${URL}"
echo "New hash: ${HASH}"
echo "Success.  Commit the changes to teku.rb to release."
