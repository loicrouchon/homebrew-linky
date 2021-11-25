class Symly < Formula
  desc "Symbolic link management tool"
  homepage "https://github.com/loicrouchon/symly"
  version "0.4"
  url "https://github.com/loicrouchon/symly/releases/download/v0.4/symly-0.4-homebrew-bottle.zip"
  sha256 "29e715888697e00955db07d45e867ee47218f9f077bcfc226211e25dc9ee6cbc"
  license "Apache-2"

  depends_on "openjdk"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/symly"
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.4", output
  end
end