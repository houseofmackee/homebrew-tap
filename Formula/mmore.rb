class Mmore < Formula
  desc "Pager like more, with Markdown rendering and syntax highlighting"
  homepage "https://github.com/houseofmackee/mmore"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.4.1/mmore-0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "bd73cfaae1174779767239dd434dfed94b80a47ec709e6da97b5d2cd6db4f5d2"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.4.1/mmore-0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "0672699607c96cc04267f671d435616d3e17577b61a9cc3db431b56246e0cab1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.4.1/mmore-0.4.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a72eb1ea7e566344ce6307c6db993cae61f8acc9cf5dab95483265a695cd2731"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.4.1/mmore-0.4.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fd342bdbad3fdfd4cf9783b166a5b8d787a2f3e3075e23ea0f21f0a46ed0f0f0"
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
