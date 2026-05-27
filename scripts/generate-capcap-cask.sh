#!/usr/bin/env bash
set -euo pipefail

if [[ "$#" -lt 2 ]] || [[ "$#" -gt 3 ]]; then
  echo "Usage: $0 <version> <sha256> [output_path]" >&2
  exit 1
fi

VERSION="$1"
SHA256="$2"
OUTPUT_PATH="${3:-Casks/capcap.rb}"

mkdir -p "$(dirname "${OUTPUT_PATH}")"

cat >"${OUTPUT_PATH}" <<EOF
cask "capcap" do
  version "${VERSION}"
  sha256 "${SHA256}"

  url "https://github.com/realskyrin/capcap/releases/download/release-v#{version}/capcap-#{version}-macos.zip"
  name "capcap"
  desc "Lightweight native menu bar screenshot tool"
  homepage "https://github.com/realskyrin/capcap"

  depends_on macos: :sonoma

  app "capcap.app"

  uninstall quit: "cn.skyrin.capcap"

  zap trash: "~/Library/Preferences/cn.skyrin.capcap.plist"
end
EOF

echo "Generated ${OUTPUT_PATH}"
