class Symly < Formula
  VERSION = "0.2.1".freeze

  desc "Symbolic link management"
  homepage "https://github.com/loicrouchon/symly"
  url "https://github.com/loicrouchon/symly/archive/v#{VERSION}.tar.gz"
  sha256 "6574e52d9fe8a75f39216c5cb783fb43ceebcd0a2771e08180d3543c976e6589"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/loicrouchon/homebrew-symly/releases/download/symly-0.1.4"
    sha256 cellar: :any_skip_relocation, catalina:     "1004ed698452df5dbe7fb5ac0b084940224a896a142b8ed1486c8e0fb1774495"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8ca324eff8a4210e6ef1fc86623b06e7a7449d1ec6f394225ac049a815681bcd"
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
    bin.install "build/libs/symly"
  end

  test do
    assert_equal "Symly version #{VERSION}", shell_output("#{bin}/symly --version").strip
  end
end
