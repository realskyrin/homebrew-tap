cask "capcap" do
  version "1.3.23"
  sha256 "3f4b48a28368a41bd1ee9ffe3fafafbf2320f4bc632e6d91bd1316d0c0dcdf77"

  url "https://github.com/realskyrin/capcap/releases/download/release-v#{version}/capcap-#{version}-macos.zip"
  name "capcap"
  desc "Lightweight native menu bar screenshot tool"
  homepage "https://github.com/realskyrin/capcap"

  depends_on macos: :sonoma

  app "capcap.app"

  uninstall quit: "cn.skyrin.capcap"

  zap trash: "~/Library/Preferences/cn.skyrin.capcap.plist"
end
