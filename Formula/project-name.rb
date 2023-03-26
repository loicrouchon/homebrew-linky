class Symly < Formula
  desc "A tool for managing symbolic links"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.10.1/symly-0.10.1-homebrew-bottle.zip"
  version "0.10.1"
  sha256 "a0a0d9a865cc1b3adab904fac9fb887b92f5ebab4c6cbdb3492d9072e95d4003"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.10.1", output
  end
end
