class Mmore < Formula
  desc "Pager like more, with Markdown rendering and syntax highlighting"
  homepage "https://github.com/houseofmackee/mmore"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.4.0/mmore-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "74624f0deae52669004420e6e4f031c4c0d121de6863a8e858e829d3cb3983a2"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.4.0/mmore-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "3235a8dbec9d39ceb21fcb07b5366068c2f17112403b9f45a16a8325329bf0d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.4.0/mmore-0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7d6ce20b425211f4ba637f8f8859230b06fef02b67c5d790268ceb0e6c39b3a3"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.4.0/mmore-0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "61d3f68fdaf52a0e77f3e0b61935ee986d8332a259e8aeaf796816734e4d24b2"
    end
  end

  def install
    bin.install "mmore"
  end

  test do
    assert_match "mmore #{version}", shell_output("#{bin}/mmore --version")
    (testpath/"hello.md").write("# Hello\n")
    # Output that is not a terminal is passed through unchanged.
    assert_equal "# Hello\n", shell_output("#{bin}/mmore #{testpath}/hello.md")
  end
end
