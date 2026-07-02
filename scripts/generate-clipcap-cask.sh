#!/usr/bin/env bash
set -euo pipefail

if [[ "$#" -lt 2 ]] || [[ "$#" -gt 3 ]]; then
  echo "Usage: $0 <version> <sha256> [output_path]" >&2
  exit 1
fi

VERSION="$1"
SHA256="$2"
OUTPUT_PATH="${3:-Casks/clipcap.rb}"

mkdir -p "$(dirname "${OUTPUT_PATH}")"

cat >"${OUTPUT_PATH}" <<EOF
cask "clipcap" do
  version "${VERSION}"
  sha256 "${SHA256}"

  url "https://github.com/realskyrin/clipcap/releases/download/release-v#{version}/clipcap-#{version}-macos.zip"
  name "clipcap"
  desc "Permission-light Mac image annotation tool"
  homepage "https://github.com/realskyrin/clipcap"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "clipcap.app"

  uninstall quit: "cn.skyrin.clipcap"

  zap trash: "~/Library/Preferences/cn.skyrin.clipcap.plist"
end
EOF

echo "Generated ${OUTPUT_PATH}"
