class Cassette < Formula
  desc "Cassette command-line client"
  homepage "https://cassette.sh"
  url "https://github.com/jordanful/cassette/releases/download/cassette-cli-v0.1.0/cassette-cli-0.1.0.gem"
  sha256 "b2d32868938f5da5c27e43a18971b540f24673c2ea3953929b85516e4fec949e"
  license "MIT"

  depends_on "ruby"

  def install
    system "gem", "install", cached_download, "--install-dir", libexec
    (bin/"cassette").write_env_script libexec/"bin/cassette", GEM_HOME: libexec
  end

  test do
    assert_match "Cassette CLI", shell_output("#{bin}/cassette help")
  end
end
