class Symly < Formula
  desc "A tool for managing symbolic links"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/releases/download/v0.10.3/symly-0.10.3-homebrew-bottle.zip"
  version "0.10.3"
  sha256 "bc476c453e521b0db6c407675369226d033ceb79632fbe2849ff11212ed27940"
  license "Apache-2.0"

  depends_on "coreutils"
  depends_on "openjdk"

  def install
    prefix.install Dir["*"]
  end

  test do
    output = shell_output("#{bin}/symly --version")
    assert_match "0.10.3", output
  end
end
