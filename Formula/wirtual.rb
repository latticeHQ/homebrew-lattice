# typed: false
# frozen_string_literal: true

class Wirtual < Formula
  desc "A self-hosted remote development platform"
  homepage "https://wirtual.dev"
  version "5.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wirtualdev/wirtualdev/releases/download/v5.1.0/wirtual_5.1.0_darwin_arm64.zip"
      sha256 "a189f67ae2ddc20d2ac3c50e194c43e9eee61b79b537e2d9738ece4282a6122a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/wirtualdev/wirtualdev/releases/download/v5.1.0/wirtual_5.1.0_darwin_amd64.zip"
      sha256 "73a29af06e150bf7ac29d008d6924ce05b36de10ae8e6c98c6d57eb7793fa43b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/wirtualdev/wirtualdev/releases/download/v5.1.0/wirtual_5.1.0_linux_arm64.tar.gz"
      sha256 "cf44d87cef721f21072403972b1ac79abdc7644218a377553ffaf2db5170955f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/wirtualdev/wirtualdev/releases/download/v5.1.0/wirtual_5.1.0_linux_amd64.tar.gz"
      sha256 "1a27e71cec26257ed4fed92d742d6b751472821456aa5cb207ef06b83b8778e1"
    end
  end

  def install
    bin.install "wirtual"
  end

  test do
    system "#{bin}/wirtual", "version"
  end
end
