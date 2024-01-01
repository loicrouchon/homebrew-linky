class Symly < Formula
  desc "Utility for centralizing sparse file trees with symbolic links"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.11.4/symly-0.11.4-homebrew.zip"
  sha256 "ab0a3254294bbce0e30c3c5c111b3bd3798eab9ef1af207bc8fa63a1f080013c"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.11.4", output
  end
end
