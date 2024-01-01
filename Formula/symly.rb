class Symly < Formula
  desc "Utility for centralizing sparse file trees with symbolic links"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.11.5/symly-0.11.5-homebrew.zip"
  sha256 "d6a3746a310c6eeeb3d1cbe504947d6d946cb5a2da654a12062fd9a2f8c0349d"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.11.5", output
  end
end
