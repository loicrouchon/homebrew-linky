class Symly < Formula
  desc "A tool for managing symbolic links"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.8.2/symly-0.8.2-homebrew-bottle.zip"
  version "0.8.2"
  sha256 "502ae381530b4ec414f82a041bf6cf2ff6150e145956424caa8b53aa7c809d92"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.8.2", output
  end
end
