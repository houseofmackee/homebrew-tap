class Mmore < Formula
  desc "Pager like more, with Markdown rendering and syntax highlighting"
  homepage "https://github.com/houseofmackee/mmore"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.3.0/mmore-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "9e05dab659f33bdea9e8b06c1840a7d4276c02ff2c0236f070a0edb4b99c5f52"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.3.0/mmore-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "72c1174334978b0ac23d8e8e69e8b7285b6ac45a83afb656ada13fc85ca42f61"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.3.0/mmore-0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0a0659c680643106e0d2ff56680e32999be0a64bd6eea3e40243157e496051b1"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.3.0/mmore-0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4a87b8209b7c1c1570a48b02e8d8a84f1d4c443dc7105743e3942bc11a6c85b0"
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
