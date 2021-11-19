class Symly < Formula
  VERSION = "0.3.6".freeze

  desc "Symbolic link management"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/archive/v#{VERSION}.tar.gz"
  sha256 "44d68265ea8ab47b118a9570afd44aabb9cbf0c2c23f58b6ec056f5fdd19883e"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/loicrouchon/homebrew-symly/releases/download/symly-0.3.1"
    sha256 cellar: :any_skip_relocation, catalina:     "9182ce4954b926888153d8f84fc856c17eefc6d79c34916704f4106faf0a4e4c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c6db96ae0f37bd0aca15f4310ba83a5fc24bc93772ec0cd64f8acdf2cf8a97bc"
  end

  depends_on "openjdk"

  def install
    system "./gradlew", "-Pversion=#{VERSION}", "--console=plain", "clean", "check", "installDist"
    bin.install "src/main/packaging/homebrew/symly"
    libexec.install "build/install/symly/bin"
    libexec.install "build/install/symly/lib"
    doc.install Dir["build/install/symly/doc/html5/*"]
    man1.install Dir["build/install/symly/doc/manpage/*"]
  end

  test do
    assert_equal "Symly version #{VERSION}", shell_output("#{bin}/symly --version").strip
  end
end
