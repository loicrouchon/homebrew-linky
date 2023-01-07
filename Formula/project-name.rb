class Symly < Formula
  desc "A tool for managing symbolic links"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.9.3/symly-0.9.3-homebrew-bottle.zip"
  version "0.9.3"
  sha256 "dd8646c1ee98cb580646660e5cdefad761e68c958c7824c0fac45fc006f0b546"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.9.3", output
  end
end
