class Mmore < Formula
  desc "Pager like more, with Markdown rendering and syntax highlighting"
  homepage "https://github.com/houseofmackee/mmore"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.5.0/mmore-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "08826c1a85d3ccb5563a9b2bcf060d968153a81ff1dbaff886aa191447165485"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.5.0/mmore-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "004594ad599b8bb20472b91af741da49538a87699bb5c5fd564a54b69884eaaa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.5.0/mmore-0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ab45b63bd867679da450ea5c570eed4e1ca63a7b4e32dc617b677cc7b40faef8"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.5.0/mmore-0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ea546cbc6ca58ef53ee768a9a4f4febebb2651aac09ee656d8684fa288f5bd5d"
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
