cask "unifai" do
  version "0.9.2"
  sha256 "1c40f373a3d2075f4aecac080a8812c506bd05f82dcb755bd7fe79844eef97fe"

  url "https://github.com/kennykankush/Unifai/releases/download/v#{version}/Unifai-#{version}.zip"
  name "Unifai"
  desc "Local hub for AI wallets, spend, renewals and releases, with a read-only MCP server"
  homepage "https://github.com/kennykankush/Unifai"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Unifai.app"
  binary "#{appdir}/Unifai.app/Contents/MacOS/unifai-mcp"

  uninstall quit: "dev.unifai.app"

  zap trash: [
    "~/Library/Application Support/Unifai",
    "~/Library/Preferences/dev.unifai.app.plist",
  ]
end
