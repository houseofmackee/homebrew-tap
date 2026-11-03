class Mmore < Formula
  desc "Pager like more, with Markdown rendering and syntax highlighting"
  homepage "https://github.com/houseofmackee/mmore"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.6.3/mmore-0.6.3-aarch64-apple-darwin.tar.gz"
      sha256 "b878deceee524105b1e94e94b40690e3007effcd4dae074fbb1046cd8a6415db"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.6.3/mmore-0.6.3-x86_64-apple-darwin.tar.gz"
      sha256 "a56efd2fe0ae23dcd5a966260ca1688a09400ba005b1dbf2770cdc8232fa9bd6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.6.3/mmore-0.6.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0b4a66ea625982d926043e61dbd60e0a2650ad54cfef782af85089a21c25d76d"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.6.3/mmore-0.6.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2e19a129c0aa00aa128d6a82f2e9fb8e6556ef19a681ff2334ad79f7d90a1116"
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
