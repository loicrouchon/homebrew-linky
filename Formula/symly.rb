class Symly < Formula
  desc "Utility for centralizing sparse file trees with symbolic links"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.11.7/symly-0.11.7-homebrew.zip"
  sha256 "3514cc4cb4a820156529d90f086988c44a6f6f4b6277b899070a571f66b66985"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.11.7", output
  end
end
