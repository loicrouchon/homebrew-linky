class Symly < Formula
  desc "Symbolic link management tool"
  homepage "https://github.com/loicrouchon/symly"
  version "0.4.3"
  url "https://github.com/loicrouchon/symly/releases/download/v0.4.3/symly-0.4.3-homebrew-bottle.zip"
  sha256 "469183da5f04fffc8fc655ce822f269e4f1abada89684c3ca613e4cbd5fcb822"
  license "Apache-2"

  depends_on "openjdk"
  depends_on "coreutils"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/symly"
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.4.3", output
  end
end