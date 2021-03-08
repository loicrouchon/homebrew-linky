class Linky < Formula
  VERSION = "0.1.2".freeze

  bottle do
    root_url "https://github.com/loicrouchon/homebrew-linky/releases/download/linky-0.1.2"
    sha256 cellar: :any_skip_relocation, catalina:     "e1dd29f39102d968e7e50c99d46d3e098787b47cad882309043713f2d70e79b5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "23fe5235b736d85054531fdfb59d6984039e1742ac940b4f0939092c536587ef"
  end
  GRAALVM_VERSION = "21.0.0.2".freeze
  GRAALVM_BASE_URL = "https://github.com/graalvm/graalvm-ce-builds/releases/download".freeze

  desc "Symbolic link management"
  homepage "https://github.com/loicrouchon/linky"
  url "https://github.com/loicrouchon/linky/archive/v#{VERSION}.tar.gz"
  sha256 "ecd1d29381c0d917c9e3bf9512ce4d2de593232ceb4ca8b23360b7e217145bd5"
  license "Apache-2.0"

  option "with-jvm-runtime", "Uses a JVM for the runtime instead of a native-image (JVM must be installed manually)"

  depends_on "zlib" unless OS.mac?

  LAUNCHER = "build/install/linky/bin/linky".freeze

  def install
    install_jvm_mode if build.with? "jvm-runtime"
    install_native_mode if build.without? "jvm-runtime"
  end

  def install_jvm_mode
    system "./gradlew -Pversion=#{VERSION} --console=plain clean installDist"
    inreplace LAUNCHER, %r{\$APP_HOME/lib/}, "$APP_HOME/libexec/"
    bin.install LAUNCHER
    libexec.install Dir["build/install/linky/lib/*"]
  end

  def install_native_mode
    graalvm_home = install_native_image_compiler
    ENV["JAVA_HOME"] = graalvm_home
    ENV["GRAALVM_HOME"] = graalvm_home
    system "./gradlew -Pversion=#{VERSION} --console=plain clean buildNativeImage"
    bin.install "build/libs/linky"
  end

  def install_native_image_compiler
    graalvm_arch = ""
    graalvm_home = ""
    on_linux do
      graalvm_arch = "graalvm-ce-java11-linux-amd64"
      graalvm_home = "#{Dir.pwd}/graalvm/graalvm-ce-java11-#{GRAALVM_VERSION}"
    end
    on_macos do
      graalvm_arch = "graalvm-ce-java11-darwin-amd64"
      graalvm_home = "#{Dir.pwd}/graalvm/graalvm-ce-java11-#{GRAALVM_VERSION}/Contents/Home"
    end
    graalvm_url = "#{GRAALVM_BASE_URL}/vm-#{GRAALVM_VERSION}/#{graalvm_arch}-#{GRAALVM_VERSION}.tar.gz"
    system "curl --silent -L #{graalvm_url} -o graalvm.tar.gz"
    system "mkdir -p graalvm"
    system "tar xzf graalvm.tar.gz --directory graalvm"
    system "ls -l #{graalvm_home}"
    system "#{graalvm_home}/bin/gu install native-image"
    graalvm_home
  end

  test do
    assert_equal "Linky version #{VERSION}", shell_output("#{bin}/linky --version").strip
  end
end
