class Cassette < Formula
  desc "Cassette command-line client"
  homepage "https://cassette.sh"
  url "https://github.com/Kaizen-Labs-Inc/cassette-cli-releases/releases/download/cassette-cli-v0.1.1/cassette-cli-0.1.1.gem"
  sha256 "84b1e531d21dbd39715859099e80f27e3629b7215741686974a82a8b976ea139"
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
