class HiveCli < Formula
  desc "Multi-session Claude Code coordinator"
  homepage "https://github.com/canderson22/hive"
  version "0.2.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/canderson22/hive/releases/download/v#{version}/hive-darwin-arm64"
      sha256 "1bfa966f2cddfaec6b3735a66713fb422bb77e9b9c2e8cc5307d75dd943823da"

      def install
        bin.install "hive-darwin-arm64" => "hive"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/canderson22/hive/releases/download/v#{version}/hive-darwin-x64"
      sha256 "8881d99f3538d95befa45f32025e8bf5c5b21859cb02979c1ef4a8f3197bf865"

      def install
        bin.install "hive-darwin-x64" => "hive"
      end
    end
  end

  on_linux do
    url "https://github.com/canderson22/hive/releases/download/v#{version}/hive-linux-x64"
    sha256 "1670f070667a2212cca27f7df1e7c18ffdb16b2d257f330094a5341da2a14b9b"

    def install
      bin.install "hive-linux-x64" => "hive"
    end
  end

  test do
    assert_match "hive", shell_output("#{bin}/hive --version")
  end
end
