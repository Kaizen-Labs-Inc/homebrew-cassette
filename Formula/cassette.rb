class Cassette < Formula
  desc "Cassette command-line client"
  homepage "https://cassette.sh"
  url "https://github.com/Kaizen-Labs-Inc/cassette-cli-releases/releases/download/cassette-cli-v0.1.3/cassette-cli-0.1.3.gem"
  sha256 "c89d51f594c1a93a8ba021faa6e3b4e969e8749dd289cf545be2225a0e0fa464"
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
