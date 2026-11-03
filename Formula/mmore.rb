class Mmore < Formula
  desc "Pager like more, with Markdown rendering and syntax highlighting"
  homepage "https://github.com/houseofmackee/mmore"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.8.0/mmore-0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "98f35be94e417fed96e134411965c97a2606ebd23f2bafbe1e086576316e2c66"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.8.0/mmore-0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "28e0f471f5794c5d6ab6c76591b133f4f2d7226ecf48a9d95d3ccca4bf676dd0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.8.0/mmore-0.8.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "be79cb4169b214c964a6071b22f1ce3cbc4bc6c4cbc5900fa8dd5bb01cf8907c"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.8.0/mmore-0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "47d855778b841c49e273a051ff5897b8860aa49d97c9410267869084a39eb4f1"
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
