class HiveCli < Formula
  desc "Multi-session Claude Code coordinator"
  homepage "https://github.com/canderson22/hive"
  version "0.2.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/canderson22/hive/releases/download/v#{version}/hive-darwin-arm64"
      sha256 "9acce06156e4d26af54b5df286b3508a8518118c472d463169088ac4bbc421b2"

      def install
        bin.install "hive-darwin-arm64" => "hive"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/canderson22/hive/releases/download/v#{version}/hive-darwin-x64"
      sha256 "7fe6a96f49732ea5f83050e7eab05954086b891b1a734740b961f149ec5064d7"

      def install
        bin.install "hive-darwin-x64" => "hive"
      end
    end
  end

  on_linux do
    url "https://github.com/canderson22/hive/releases/download/v#{version}/hive-linux-x64"
    sha256 "274cef680661637eda86a92b1314b2a9707cafff0c44ca950d6e9761927f2fed"

    def install
      bin.install "hive-linux-x64" => "hive"
    end
  end

  test do
    assert_match "hive", shell_output("#{bin}/hive --version")
  end
end
