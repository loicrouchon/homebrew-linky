class Symly < Formula
  desc "Symbolic link management tool"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.8.1/symly-0.8.1-homebrew-bottle.zip"
  version "0.8.1"
  sha256 "837792fb1eb1a3e653af27afe7d24eaa1ca94e6ab34b963af3d58a5d3c209627"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.8.1", output
  end
end
