class Symly < Formula
  desc "Utility for centralizing sparse file trees with symbolic links"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.11.6/symly-0.11.6-homebrew.zip"
  sha256 "fe9cf5997af0efcd2029d6cca053a5b11294d21c67f35e2056185d25cf658749"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.11.6", output
  end
end
