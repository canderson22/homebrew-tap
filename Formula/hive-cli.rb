class HiveCli < Formula
  desc "Multi-session Claude Code coordinator"
  homepage "https://github.com/canderson22/hive"
  version "0.2.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/canderson22/hive/releases/download/v#{version}/hive-darwin-arm64"
      sha256 "fa21459bc022b9a6ec65bf4e55ec2a168597756928e190e7b42067e1afeae5be"

      def install
        bin.install "hive-darwin-arm64" => "hive"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/canderson22/hive/releases/download/v#{version}/hive-darwin-x64"
      sha256 "61b48e8dca81911864447a579f56f6e09b16d1dc372fc71eca8c6f5f70fb2acf"

      def install
        bin.install "hive-darwin-x64" => "hive"
      end
    end
  end

  on_linux do
    url "https://github.com/canderson22/hive/releases/download/v#{version}/hive-linux-x64"
    sha256 "6c613feee634b97eba6cb18ace438456e163b06e25fab0a904cbb1f0a6b09e65"

    def install
      bin.install "hive-linux-x64" => "hive"
    end
  end

  test do
    assert_match "hive", shell_output("#{bin}/hive --version")
  end
end
