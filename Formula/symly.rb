class Symly < Formula
  desc "Symbolic link management tool"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.6.1/symly-0.6.1-homebrew-bottle.zip"
  version "0.6.1"
  sha256 "13e14a65f7372e522f9587e7ada7817925b3e9226940362a1fe89b3424f6178f"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.6.1", output
  end
end
