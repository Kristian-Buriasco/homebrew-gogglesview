cask "gogglesview" do
  version "0.10.2"
  sha256 "13c8dd0772de492fbc37e209ac4b601272bc88a7686a10e130ece9a928aa5940"

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
