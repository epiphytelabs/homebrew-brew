class Keep < Formula
  desc "Epiphyte Keep"
  homepage "https://epiphyte.xyz/"
  url "https://github.com/epiphytelabs/keep/archive/v0.1.2.tar.gz"
  sha256 "9bb6c8a2215b38735e2d32494778ca7c3ebda7a17d34cb7dcd5a69ae9d13be85"
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
    assert_equal "dev\n", shell_output("#{bin}/keep -v")
  end
end
