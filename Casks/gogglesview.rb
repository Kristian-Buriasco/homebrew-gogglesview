cask "gogglesview" do
  version "0.9.0"
  sha256 "0e4b26c981f7a84ce6477c4d5509de6e91ae0de53eb07587f16523df8d977fb0"

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
