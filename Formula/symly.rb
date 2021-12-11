class Symly < Formula
  desc "Symbolic link management tool"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.5.1/symly-0.5.1-homebrew-bottle.zip"
  version "0.5.1"
  sha256 "f75b314ed58ffba5c8320df088c6a52df11c5df507f5706655371e8e47e16902"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.5.1", output
  end
end
