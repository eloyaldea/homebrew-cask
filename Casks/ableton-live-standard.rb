cask "ableton-live-standard" do
  arch = (MacOS.version >= :mojave) ? "universal" : "intel"
  version "11.2"

  if MacOS.version >= :mojave
    sha256 "71d98a6532ba838ed26e9a5bb2c067c1915dc8846060fac69e9fe9caf97d4bd0"
  else
    sha256 "51bffe5e3ab58c943cabbd605964e74c26535e9b993a3cb76b7a7d230150ec75"
  end

  url "https://cdn-downloads.ableton.com/channels/#{version}/ableton_live_standard_#{version}_#{arch}.dmg"
  name "Ableton Live Standard"
  desc "Sound and music editor"
  homepage "https://www.ableton.com/en/live/"

  livecheck do
    cask "ableton-live-suite"
  end

  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "Ableton Live #{version.major} Standard.app"

  uninstall quit: "com.ableton.live"

  zap trash: [
    "~/Library/Application Support/Ableton",
    "~/Library/Application Support/CrashReporter/Ableton *_*.plist",
    "~/Library/Application Support/CrashReporter/Live_*.plist",
    "~/Library/Caches/Ableton",
    "~/Library/Preferences/Ableton",
    "~/Library/Preferences/com.ableton.live.plist*",
    "~/Music/Ableton",
  ]
end
