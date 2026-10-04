# jpm, from its release binaries. The release workflow of jtwebman/jpm rewrites the version and
# the four sums here for each release.
class Jpm < Formula
  desc "Fast, small, secure-by-default package manager for JavaScript"
  homepage "https://getjpm.sh"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jtwebman/jpm/releases/download/v#{version}/jpm-darwin-arm64"
      sha256 "3e45992cdfdf338234506491ccb336e695aa1104a908717ae0f6987a961b5fac"
    end
    on_intel do
      url "https://github.com/jtwebman/jpm/releases/download/v#{version}/jpm-darwin-x64"
      sha256 "134d0fddcb4d5f44a7aa7545ea4914c8c7a3e1359321cf27f2eaafa5925038dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jtwebman/jpm/releases/download/v#{version}/jpm-linux-arm64"
      sha256 "04e5fea7b2e76bbb81af0c45646348f5c48d2a74b2a452021a411c2cbdf9c998"
    end
    on_intel do
      url "https://github.com/jtwebman/jpm/releases/download/v#{version}/jpm-linux-x64"
      sha256 "f9002b3eef76a6e9c25ad1ced05c426d34c01145235522d65a30fa56dc65d4a6"
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
