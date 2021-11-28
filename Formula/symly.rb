class Symly < Formula
  desc "Symbolic link management tool"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.4.7/symly-0.4.7-homebrew-bottle.zip"
  version "0.4.7"
  sha256 "a4bee38721ec2bc4c86a56e800862bd2f6a90c7d9cb030a574a0ee415629cb56"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.4.7", output
  end
end
