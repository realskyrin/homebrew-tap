cask "capcap" do
  version "1.3.27"
  sha256 "2140aa7b97c63b4b04ac2d73e7faf65940d67daaf96e846cb4a7ed81f6c4398a"

  url "https://github.com/realskyrin/capcap/releases/download/release-v#{version}/capcap-#{version}-macos.zip"
  name "capcap"
  desc "Lightweight native menu bar screenshot tool"
  homepage "https://github.com/realskyrin/capcap"

  depends_on macos: :sonoma

  app "capcap.app"

  uninstall quit: "cn.skyrin.capcap"

  zap trash: "~/Library/Preferences/cn.skyrin.capcap.plist"
end
