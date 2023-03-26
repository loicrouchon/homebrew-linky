class Symly < Formula
  desc "A tool for managing symbolic links"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.10.2/symly-0.10.2-homebrew-bottle.zip"
  version "0.10.2"
  sha256 "e0f68e5bb26ba2a614d01128a4a28ec6cec527e369a42197185fd8b1d7d6629a"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.10.2", output
  end
end
