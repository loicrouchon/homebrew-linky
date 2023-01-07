class Symly < Formula
  desc "A tool for managing symbolic links"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.9.4/symly-0.9.4-homebrew-bottle.zip"
  version "0.9.4"
  sha256 "48305f7a9e0ce41fcf705ce2fd04060e6a29e4475ef660de555d1fbdf16e79d0"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.9.4", output
  end
end
