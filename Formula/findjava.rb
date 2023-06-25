class Findjava < Formula
  VERSION = "0.3.2".freeze

  desc "Finds the best JVM to run your java program "
  homepage "https://github.com/loicrouchon/findjava"
  url "https://github.com/loicrouchon/findjava/archive/v#{VERSION}.tar.gz"
  sha256 "066a91ea298ed49037bc7306d59224bcf82eded72c38af79598bab49f97484df"
  license "Apache-2.0"

  depends_on "make" => :build
  depends_on "golang" => :build
  depends_on "openjdk" => :build

  def install
    ENV["GO_LD_FLAGS"] = "-linkmode=external"
    if OS.mac?
        ENV["GO_TAGS"] = "-tags darwin"
    elsif OS.linux?
        ENV["GO_TAGS"] = "-tags linux"
    end
    system "make", "clean", "test", "build"
    bin.install_symlink libexec/"findjava"
    libexec.install "build/go/findjava" => "findjava"
    libexec.install "build/classes" => "metadata-extractor"
  end

  test do
    assert_equal "findjava #{VERSION}", shell_output("#{bin}/findjava --version").strip
  end
end