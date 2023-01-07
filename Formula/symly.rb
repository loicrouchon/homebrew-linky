class Symly < Formula
  desc "A tool for managing symbolic links"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.9.2/symly-0.9.2-homebrew-bottle.zip"
  version "0.9.2"
  sha256 "9df11f64a76ec3c8d320dca35ecfbb56123a61c4b00e836034cc2ecfc9ddf60d"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.9.2", output
  end
end
