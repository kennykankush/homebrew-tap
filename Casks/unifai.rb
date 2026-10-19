cask "unifai" do
  version "0.6.1"
  sha256 "a34132fc11c04b04de48b399764789fdb1a9580324168e3c32341f9bef4d22d3"

  url "https://github.com/kennykankush/Unifai/releases/download/v#{version}/Unifai-#{version}.zip"
  name "Unifai"
  desc "Local hub for AI wallets, spend, renewals and releases, with a read-only MCP server"
  homepage "https://github.com/kennykankush/Unifai"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Unifai.app"
  binary "#{appdir}/Unifai.app/Contents/MacOS/unifai-mcp"

  uninstall quit: "dev.unifai.app"

  caveats <<~EOS
    This build is signed with Developer ID but not notarized.
    If macOS blocks the first launch, open System Settings > Privacy & Security
    and click Open Anyway.
  EOS

  zap trash: [
    "~/Library/Application Support/Unifai",
    "~/Library/Preferences/dev.unifai.app.plist",
  ]
end
