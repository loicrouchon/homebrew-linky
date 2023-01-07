class Symly < Formula
  desc "A tool for managing symbolic links"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.9.1/symly-0.9.1-homebrew-bottle.zip"
  version "0.9.1"
  sha256 "d309bc61c32aaa527708ba99245eb85369ad0ec7cacbb012213634ab92f64a4a"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.9.1", output
  end
end
