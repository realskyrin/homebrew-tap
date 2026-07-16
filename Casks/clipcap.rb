cask "clipcap" do
  version "1.8.16"
  sha256 "9d1536b51f3fd5c335f3e51f556899ad1c9026e58f8a845bf0c69e3f3eeae36e"

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
