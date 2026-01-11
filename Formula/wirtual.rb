# typed: false
# frozen_string_literal: true

class Wirtual < Formula
  desc "A self-hosted remote development platform"
  homepage "https://wirtual.dev"
  version "5.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wirtualdev/wirtualdev/releases/download/v5.0.0/wirtual_5.0.0_darwin_arm64.zip"
      sha256 "PLACEHOLDER_ARM64_SHA"
    end
    if Hardware::CPU.intel?
      url "https://github.com/wirtualdev/wirtualdev/releases/download/v5.0.0/wirtual_5.0.0_darwin_amd64.zip"
      sha256 "PLACEHOLDER_AMD64_SHA"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/wirtualdev/wirtualdev/releases/download/v5.0.0/wirtual_5.0.0_linux_arm64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_ARM64_SHA"
    end
    if Hardware::CPU.intel?
      url "https://github.com/wirtualdev/wirtualdev/releases/download/v5.0.0/wirtual_5.0.0_linux_amd64.tar.gz"
      sha256 "PLACEHOLDER_LINUX_AMD64_SHA"
    end
  end

  def install
    bin.install "wirtual"
  end

  test do
    system "#{bin}/wirtual", "version"
  end
end
