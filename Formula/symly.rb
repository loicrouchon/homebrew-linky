class Symly < Formula
  desc "Symbolic link management tool"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.6.1/symly-0.6.1-homebrew-bottle.zip"
  version "0.6.1"
  sha256 "a2efe417d5d8bc569f9237fc7087ec4abbfe2f0ec30077dc4ca7605b16883d28"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.6.1", output
  end
end
