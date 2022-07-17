class Symly < Formula
  desc "Symbolic link management tool"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.6.2/symly-0.6.2-homebrew-bottle.zip"
  version "0.6.2"
  sha256 "67d0bd259d3ec01a1bc0453b4416319415d8b532a617085a261cea28059ce264"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.6.2", output
  end
end
