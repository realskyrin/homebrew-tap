cask "clipcap" do
  version "1.8.29"
  sha256 "d04c331feb7e94b97485af3fe7277aec6af039c44eaba836869b5403968f2a15"

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

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/clipcap.app"]
    end
  end

  uninstall quit: "cn.skyrin.clipcap"

  zap trash: "~/Library/Preferences/cn.skyrin.clipcap.plist"
end
