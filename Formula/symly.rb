class Symly < Formula
  desc "Utility for centralizing sparse file trees with symbolic links"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.11.3/symly-0.11.3-homebrew.zip"
  version "0.11.3"
  sha256 "75ab263ed76d663d0358c190a0dc3505bf4b712402fdf3d6fe535cad93e86f32"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.11.3", output
  end
end
