cask "unifai" do
  version "0.2.1"
  sha256 "9337f1f6d03f1e6205f8dea0418633ca8152a31e6a64ee8e79dc38a11eb75558"

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
