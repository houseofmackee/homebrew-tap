class Mmore < Formula
  desc "Pager like more, with Markdown rendering and syntax highlighting"
  homepage "https://github.com/houseofmackee/mmore"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.6.2/mmore-0.6.2-aarch64-apple-darwin.tar.gz"
      sha256 "8dbc72a67348dbab608fde338c5c980cfb958d05afe530aba2f0654f30184881"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.6.2/mmore-0.6.2-x86_64-apple-darwin.tar.gz"
      sha256 "dd23a59f837a99ce0077b71a1118f6d0162daa481439a2168b950249055dd9a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.6.2/mmore-0.6.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f2306742a65c8ac1317d9bf53cc1556237a26f4c335f9cf30af6454ff726e766"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.6.2/mmore-0.6.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c3ab1b3305983c83f538c500b877d5ca08eead16a92989f73066ce6100899412"
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
