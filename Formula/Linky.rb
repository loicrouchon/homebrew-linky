class Linky < Formula
  desc "Symbolic link management"
  homepage "https://github.com/loicrouchon/linky"
  url "https://github.com/loicrouchon/linky/archive/v0.1.1.tar.gz"
  sha256 "20fbceedc5a0e821e4f4ae10755f5c461cd9cf8c53d981b03b436e69b57e9bfa"
  license "Apache-2.0"

  depends_on "openjdk"

  LAUNCHER = "build/install/linky/bin/linky".freeze

  def install
    system "./gradlew", "-Pversion=0.1.1", "--console=plain", "clean", "installDist"
    libexec.install Dir["build/install/linky/lib/*"]
    update_launcher
    bin.install LAUNCHER
  end

  def update_launcher
    lib_linked_launcher = File.read(LAUNCHER)
    libexec_linked_launcher = lib_linked_launcher.gsub(%r{\$APP_HOME/lib/}, "$APP_HOME/libexec/")
    File.open(LAUNCHER, "w") { |file| file.puts libexec_linked_launcher }
  end

  test do
    assert_equal "Linky version 0.1.1", shell_output("#{bin}/linky --version").strip
  end
end
