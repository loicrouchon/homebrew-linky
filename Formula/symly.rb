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

  option "with-jvm-runtime", "Uses a JVM for the runtime instead of a native-image (JVM must be installed manually)"

  depends_on "zlib" unless OS.mac?

  LAUNCHER = "build/install/symly/bin/symly".freeze

  def install
    install_jvm_mode if build.with? "jvm-runtime"
    install_native_mode if build.without? "jvm-runtime"
  end

  def install_jvm_mode
    system "./gradlew", "-Pversion=#{VERSION}", "--console=plain", "clean", "installDist"
    inreplace LAUNCHER, %r{\$APP_HOME/lib/}, "$APP_HOME/libexec/"
    bin.install LAUNCHER
    libexec.install Dir["build/install/symly/lib/*"]
  end

  def install_native_mode
    ENV["VERSION"] = VERSION
    system "make", "clean", "build"
    bin.install "build/bin/symly"
  end

  test do
    assert_equal "Symly version #{VERSION}", shell_output("#{bin}/symly --version").strip
  end
end
