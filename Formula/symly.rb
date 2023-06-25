class Symly < Formula
  desc "Utility for centralizing sparse file trees with symbolic links"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.10.4/symly-0.10.4-homebrew-bottle.zip"
  sha256 "126c67e73f00ce46c3f6f8a0a3748d8eadc1f2468a5de1f4c771b7ceea3acd60"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.10.4", output
  end
end
