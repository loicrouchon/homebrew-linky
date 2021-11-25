class Symly < Formula
  desc "Symbolic link management tool"
  homepage "https://github.com/loicrouchon/symly"
  version "0.4.1"
  url "https://github.com/loicrouchon/symly/releases/download/v0.4.1/symly-0.4.1-homebrew-bottle.zip"
  sha256 "c0e87606b188ba08f5aff88fc0c4203b5a4b79772cd7976a201d71cff8d3a193"
  license "Apache-2"

  depends_on "openjdk"
  depends_on "coreutils"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/symly"
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.4.1", output
  end
end