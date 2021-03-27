class Symly < Formula
  VERSION = "0.1.4".freeze

  desc "Symbolic link management"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/archive/v#{VERSION}.tar.gz"
  sha256 "5045e2175b00b9b31d1c5163b54ba60c7eea1f4a3c897343c61e0887681165d4"
  license "Apache-2.0"

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
    bin.install "build/libs/symly"
  end

  test do
    assert_equal "Symly version #{VERSION}", shell_output("#{bin}/symly --version").strip
  end
end
