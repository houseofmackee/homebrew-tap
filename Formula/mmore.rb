class Mmore < Formula
  desc "Pager like more, with Markdown rendering and syntax highlighting"
  homepage "https://github.com/houseofmackee/mmore"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.6.0/mmore-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "b58cad3d7ee36bcf70fcc6101f8860002f255e4a9aa25ff012f8113b0658319a"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.6.0/mmore-0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "bed02407e30435a54a45d536d569b0917f9af1f2c0649361d3afe49db6eed4df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.6.0/mmore-0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4c0ec4bee777408bbd1ddff242ae9efaf6941f2f9b2da3e92af3b67a6c4e96b5"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.6.0/mmore-0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7c0ba0acf31ad4ac89905704b0f39404e981ba55fedfecfcced422de6b6be20d"
    end
  end

  def install
    bin.install "mmore"
    generate_completions_from_executable(bin/"mmore", "--completions")
    (man1/"mmore.1").write Utils.safe_popen_read(bin/"mmore", "--man")
  end

  test do
    assert_match "mmore #{version}", shell_output("#{bin}/mmore --version")
    (testpath/"hello.md").write("# Hello\n")
    # Output that is not a terminal is passed through unchanged.
    assert_equal "# Hello\n", shell_output("#{bin}/mmore #{testpath}/hello.md")
  end
end
