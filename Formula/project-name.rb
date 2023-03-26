class Symly < Formula
  desc "A tool for managing symbolic links"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.10.0/symly-0.10.0-homebrew-bottle.zip"
  version "0.10.0"
  sha256 "de8095fd4de8585d1a9a3db965a9e33e53c65c8bb0b5a2e2ed86b967caa5b0d9"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.10.0", output
  end
end
