class Keep < Formula
  desc "Epiphyte Keep"
  homepage "https://epiphyte.xyz/"
  url "https://github.com/epiphytelabs/keep/archive/v0.0.2.tar.gz"
  sha256 "24ee7c4e265b36e9a1306f57286d1a90a0c6abc8991a1ece1f6febf1b5a2ad8f"
  license "GPL-3.0-or-later"
  version_scheme 1

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
    ]

    system "go", "build", "-mod=vendor", *std_go_args(ldflags: ldflags), "./cmd/keep"
  end

  test do
    assert_equal "dev\n", shell_output("#{bin}/keep version")
  end
end
