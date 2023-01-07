class Symly < Formula
  desc "A tool for managing symbolic links"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.9.0/symly-0.9.0-homebrew-bottle.zip"
  version "0.9.0"
  sha256 "cce30d9a86caff941769e9e76d90448be982cf3154a1533145123926d30264f7"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.9.0", output
  end
end
