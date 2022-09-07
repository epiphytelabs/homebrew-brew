class Keep < Formula
  desc "Epiphyte Keep"
  homepage "https://epiphyte.xyz/"
  url "https://github.com/epiphytelabs/keep/archive/v0.1.0.tar.gz"
  sha256 "5342896c20ec3c119cdde174a5598058fa35831fbef7739c3e1a672472a9f534"
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
