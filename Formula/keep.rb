class Keep < Formula
  desc "Epiphyte Keep"
  homepage "https://epiphyte.xyz/"
  url "https://github.com/epiphytelabs/keep/archive/v0.0.3.tar.gz"
  sha256 "4058fd111122727e25059d6aecfb3de14b21aa61697a1bbdb5400aa93624ea54"
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
