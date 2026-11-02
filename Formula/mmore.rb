class Mmore < Formula
  desc "Pager like more, with Markdown rendering and syntax highlighting"
  homepage "https://github.com/houseofmackee/mmore"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.1.0/mmore-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "a0ab8ad12fb346fcf4907d98357e2f8d41349fb7aa16396d5e95fbd1939720b3"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.1.0/mmore-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "bd7113420ab139848277ec6342b0012be3dee6080ec89ca7026cc298e0728c0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.1.0/mmore-0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3c67287f97f0dd7ad26864b040805d86bc5e18c4ce7e5df269e04873444836db"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.1.0/mmore-0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1724ff65b10688480cd541ae20ebc5aa64c2c4a337c7b6696d067c1617c370a5"
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
