# jpm, from its release binaries. The release workflow of jtwebman/jpm rewrites the four urls'
# version and their sums for each release; Homebrew reads the version from the urls.
class Jpm < Formula
  desc "Fast, small, secure-by-default package manager for JavaScript"
  homepage "https://getjpm.sh"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jtwebman/jpm/releases/download/v1.0.2/jpm-darwin-arm64"
      sha256 "eff08a1d9f94936bf76862cc0a73308c59ddef1f4e0cc65136dbe6a729328cde"
    end
    on_intel do
      url "https://github.com/jtwebman/jpm/releases/download/v1.0.2/jpm-darwin-x64"
      sha256 "b172e5c9f97ca9b3527b749711b0403e8fbd5a2784cca958141cebcc701b435c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jtwebman/jpm/releases/download/v1.0.2/jpm-linux-arm64"
      sha256 "38c27a2ed47b1decbc97554d9f1d1c51cf8f702d2eca086464549a9cf581798a"
    end
    on_intel do
      url "https://github.com/jtwebman/jpm/releases/download/v1.0.2/jpm-linux-x64"
      sha256 "af9d50842baeaafa5673637626d14ebfc473164bbca41b13277dabc613733636"
    end
  end

  def install
    # The download is the binary itself, named for its platform (jpm-darwin-arm64, …).
    bin.install Dir["jpm-*"].first => "jpm"
    bin.install_symlink "jpm" => "jpx"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/jpm --version").strip
    assert_equal version.to_s, shell_output("#{bin}/jpx --version").strip
  end
end
