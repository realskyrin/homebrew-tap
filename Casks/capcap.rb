cask "capcap" do
  version "1.5.3"
  sha256 "b05f8dd0a8665bb7d3c3c5b10605a30751fb8be673f37cb95e24a2a945dea242"

  url "https://github.com/realskyrin/capcap/releases/download/release-v#{version}/capcap-#{version}-macos.zip"
  name "capcap"
  desc "Lightweight native menu bar screenshot tool"
  homepage "https://github.com/realskyrin/capcap"

  depends_on macos: :sonoma

  app "capcap.app"

  uninstall quit: "cn.skyrin.capcap"

  zap trash: "~/Library/Preferences/cn.skyrin.capcap.plist"
end
