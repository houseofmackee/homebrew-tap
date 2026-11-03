class Mmore < Formula
  desc "Pager like more, with Markdown rendering and syntax highlighting"
  homepage "https://github.com/houseofmackee/mmore"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.6.1/mmore-0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "42497ef61335bb4a3808f064e68e98d8a390be06ac2be62086e466c1da2fc095"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.6.1/mmore-0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "abf8543dd7de45e12dbf35834bc8e197fa4ab418ff2dd581886f0d4940c6340a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.6.1/mmore-0.6.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2968bcd5a020158a01622de92007b869880fdfbc7a56b2f84541c38e9222d9e0"
    end
    on_intel do
      url "https://github.com/houseofmackee/mmore/releases/download/v0.6.1/mmore-0.6.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2e0759711ffdfa2cd3c5b60006b92fbd7977deafd6f41e6a576446b049b793da"
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
