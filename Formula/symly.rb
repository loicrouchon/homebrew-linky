class Symly < Formula
  desc "Symbolic link management tool"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.7.1/symly-0.7.1-homebrew-bottle.zip"
  version "0.7.1"
  sha256 "7995cc85c4d6dba6d124177d9d03f34f9ca43704c2b601c64eb6d05f5fc75c92"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.7.1", output
  end
end
