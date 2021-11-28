class Symly < Formula
  desc "Symbolic link management tool"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.4.6/symly-0.4.6-homebrew-bottle.zip"
  version "0.4.6"
  sha256 "810a648a147fbcf69f500e1c88fb1d2b06e617b952f06f63f0557c221d504ae5"
  license "Apache-2"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.4.6", output
  end
end
