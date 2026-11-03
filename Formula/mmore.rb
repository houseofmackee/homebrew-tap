class Mmore < Formula
  desc "Pager like more, with Markdown rendering and syntax highlighting"
  homepage "https://github.com/houseofmackee/mmore"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.7.0/mmore-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "1dc6074dd252fd7815e6cd9c670835848d313320829344af2b72f0ed9d6acd85"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.7.0/mmore-0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "b2d3392ba818e04d6947d72214ce465b49993f78e70cb01b0304fef0058d7789"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.7.0/mmore-0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1d47e5db4d090815e441085081f7edf545cb6f79608fbd997a586d86a3b7b0fb"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.7.0/mmore-0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ac1655c9fd7d2cc1f13bea9717819a7c8f519b14736b5e9d2dc411b1ba7c4b18"
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
