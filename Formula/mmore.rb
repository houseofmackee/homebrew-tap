class Mmore < Formula
  desc "Pager like more, with Markdown rendering and syntax highlighting"
  homepage "https://github.com/houseofmackee/mmore"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.9.0/mmore-0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "59e3804056dbe2290a6e7551bd46dd3edc2f170262305b230977fbe65ca61579"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.9.0/mmore-0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "465f421ce388ed7e0df9238459c9c2e25e91666de0b451180399804e7da62cf7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.9.0/mmore-0.9.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a8f0a3b209a87854b9665511c7eb709836d04604b8c57f60c512342cc57fda59"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.9.0/mmore-0.9.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f0e45017ba083ff3762417f854bbbb2b310fa6caf4aa4269983ab66f0cc518ef"
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
