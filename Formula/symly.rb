class Symly < Formula
  VERSION = "0.3.1".freeze

  desc "Symbolic link management"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/archive/v#{VERSION}.tar.gz"
  sha256 "615b00aa9623e345832e39c087c536c66177a1e85189090126dc633ec53ff173"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/loicrouchon/homebrew-symly/releases/download/symly-0.2.3"
    sha256 cellar: :any_skip_relocation, catalina:     "24bdf0e332dd09fdaf3c8d1dab5eee1be056e4702513569fc5d30ee791eed730"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8870f94bca45fdce6e528049db2f9c1e657377da95c3a3086a5c2a1ba41e77e2"
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
