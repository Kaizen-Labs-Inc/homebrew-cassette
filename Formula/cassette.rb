class Cassette < Formula
  desc "Cassette command-line client"
  homepage "https://cassette.sh"
  url "https://github.com/Kaizen-Labs-Inc/cassette-cli-releases/releases/download/cassette-cli-v0.1.2/cassette-cli-0.1.2.gem"
  sha256 "5f8483103a2b911c287faf3904ac109e21e56a37624414433831b28a66db6d30"
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
