class Hive < Formula
  desc "Multi-session Claude Code coordinator"
  homepage "https://github.com/canderson22/hive"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/canderson22/hive/releases/download/v#{version}/hive-darwin-arm64"
      sha256 "3357df5843f1f0eaa9b3387b6094842c75366097f313c2b43ba892388ad635b6"

      def install
        bin.install "hive-darwin-arm64" => "hive"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/canderson22/hive/releases/download/v#{version}/hive-darwin-x64"
      sha256 "f40bf274435a75da8d62bdab97e30a9056cecee3c9bfdb64adeaec44e1f2f58f"

      def install
        bin.install "hive-darwin-x64" => "hive"
      end
    end
  end

  on_linux do
    url "https://github.com/canderson22/hive/releases/download/v#{version}/hive-linux-x64"
    sha256 "f46b18ff9db991c0416f2360489bd14c2eb919f119fdc7312731b29d7b64ec5c"

    def install
      bin.install "hive-linux-x64" => "hive"
    end
  end

  test do
    assert_match "hive", shell_output("#{bin}/hive --version")
  end
end
