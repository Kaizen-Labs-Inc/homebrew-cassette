class Cassette < Formula
  desc "Cassette command-line client"
  homepage "https://cassette.sh"
  url "https://github.com/Kaizen-Labs-Inc/cassette-cli-releases/releases/download/cassette-cli-v0.1.0/cassette-cli-0.1.0.gem"
  sha256 "a97903852133cc3a91e5eb80b54217d70767bd75a9eceb1364afe74460e50e74"
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
