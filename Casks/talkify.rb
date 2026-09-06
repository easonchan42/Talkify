cask "talkify" do
  version "0.8.1"
  sha256 "043ffa14678768e082fea60293f76d50b4843ddab468f1012a055702a7dfc584"

  url "https://github.com/tornikegomareli/Talkify/releases/download/v#{version}/Talkify.dmg"
  name "Talkify"
  desc "Lightning-fast, local first voice dictation from the notch"
  homepage "https://github.com/tornikegomareli/Talkify"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "Talkify.app"

  uninstall quit: "com.tgomareli.Talkify"

  zap trash: [
    "~/Library/Application Support/Talkify",
    "~/Library/Preferences/com.tgomareli.Talkify.plist",
    "~/Library/Saved Application State/com.tgomareli.Talkify.savedState",
  ]

  caveats do
    <<~EOS
      Talkify needs Microphone, Speech Recognition, Accessibility and Input
      Monitoring permissions. It asks for them on first launch — dictation
      reads keys globally and inserts text into other apps.
    EOS
  end
end
