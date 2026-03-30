class Cassette < Formula
  desc "Cassette command-line client"
  homepage "https://cassette.sh"
  url "https://github.com/Kaizen-Labs-Inc/cassette-cli-releases/releases/download/cassette-cli-v0.1.4/cassette-cli-0.1.4.gem"
  sha256 "81b04a61974f40c1982f4d15ac5a516db022885f5d58a2daaf57b5d4c845ddd9"
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
