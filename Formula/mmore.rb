class Mmore < Formula
  desc "Pager like more, with Markdown rendering and syntax highlighting"
  homepage "https://github.com/houseofmackee/mmore"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.2.0/mmore-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "64c19e5ba4dc5f2274d5c0645829741bad72999e8cb7c1258f8a1870f3ca872e"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.2.0/mmore-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "ca2c35ee9b77f0f067233c35d8552c7a243967b0f78a7506978b1ccf04b3652d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.2.0/mmore-0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0ff4cb95c538c0b1e0c84b1b4409af038c93af9d54f451a8d2131c34e662cfdc"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.2.0/mmore-0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c90059d39239a951ba337e50ea7693c95842b3ec5c904606b97bb65ce6411593"
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
