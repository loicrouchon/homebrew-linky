class Symly < Formula
  desc "Symbolic link management tool"
  homepage "https://github.com/loicrouchon/symly"
  version "0.4.4"
  url "https://github.com/loicrouchon/symly/releases/download/v0.4.4/symly-0.4.4-homebrew-bottle.zip"
  sha256 "65af55e355d5b91fff2ee478a7f36e192bde98ede6deeb42d4cd1baae71ad2d2"
  license "Apache-2"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/symly"
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.4.4", output
  end
end