class Linky < Formula
  desc "Symbolic link management"
  homepage "https://github.com/loicrouchon/linky"
  url "https://codeload.github.com/loicrouchon/linky/tar.gz/v0.1.1"
  version "0.1.1"
  sha256 "20fbceedc5a0e821e4f4ae10755f5c461cd9cf8c53d981b03b436e69b57e9bfa"
  license "Apache-2.0"

  depends_on "openjdk"

  Launcher = "build/install/linky/bin/linky"
  
  def install
    system "./gradlew", "-Pversion=0.1.1", "--console=plain", "clean", "installDist"
    libexec.install Dir["build/install/linky/lib/*"]
    updateLauncher
    bin.install Launcher
  end

  def updateLauncher
    libLinkedLauncher = File.read(Launcher)
    libexecLinkedLauncher = libLinkedLauncher.gsub(/\$APP_HOME\/lib\//, "$APP_HOME/libexec/")
    File.open(Launcher, "w") {|file| file.puts libexecLinkedLauncher }
  end

  test do
    assert_equal "Linky version 0.1.1", shell_output("#{bin}/linky --version").strip
  end
end
