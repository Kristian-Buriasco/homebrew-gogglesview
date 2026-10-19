cask "gogglesview" do
  version "0.10.3"
  sha256 "b2ee38f7ad995db5e9730b9c722f7d4064dfcf5e9876d3c59aee1c789adecdef"

  url "https://github.com/Kristian-Buriasco/gogglecast/releases/download/v#{version}/GogglesView-#{version}.dmg"
  name "GogglesView"
  desc "Live view for DJI Goggles 3 over USB-C"
  homepage "https://kristian-buriasco.github.io/gogglecast/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "GogglesView.app"

  zap trash: [
    "~/Library/Application Support/GogglesView",
    "~/Library/Preferences/com.kburiasco.gogglesview.plist",
  ]

  caveats <<~EOS
    GogglesView is not notarized. On first launch, right-click the app and choose Open.
    It registers a helper in System Settings > General > Login Items & Extensions, which you need to approve once.
  EOS
end
