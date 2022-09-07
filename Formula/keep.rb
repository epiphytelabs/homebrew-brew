class Keep < Formula
  desc "Epiphyte Keep"
  homepage "https://epiphyte.xyz/"
  url "https://github.com/epiphytelabs/keep/archive/v0.1.1.tar.gz"
  sha256 "a846e87c9c397aa3a49f9e4ba676e89881e11450535215b1795ec50f7027a4a7"
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
