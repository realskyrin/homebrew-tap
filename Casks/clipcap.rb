cask "clipcap" do
  version "1.8.13"
  sha256 "17312283120fc69c9a28a1ddc8005ed5d5ddfd75badf0d89ca482248109d744c"

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
