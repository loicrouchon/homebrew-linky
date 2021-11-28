class Symly < Formula
  desc "Symbolic link management tool"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.4.5/symly-0.4.5-homebrew-bottle.zip"
  version "0.4.5"
  sha256 "abe4f9524ebb7e4591d1772c38397fcfce7e17cfdbec2c2a2ae27062121f1c9d"
  license "Apache-2"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
    bin.install_symlink "#{bin}/symly"
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.4.5", output
  end
end
