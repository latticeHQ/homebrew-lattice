# typed: false
# frozen_string_literal: true

class Wirtual < Formula
  desc "A self-hosted remote development platform"
  homepage "https://wirtual.dev"
  version "5.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v5.2.2/wirtual_5.2.2_darwin_arm64.zip"
      sha256 "a6fc802788c36c0737261d83ffabdc517f160c73aa4c497fd4112db57aa70caf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v5.2.2/wirtual_5.2.2_darwin_amd64.zip"
      sha256 "9abc3a49e42abc2d7163a1568f0d33175666be45f32ae166488b3031ff8f7d59"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v5.2.2/wirtual_5.2.2_linux_arm64.tar.gz"
      sha256 "2779e85f944f82b97bf1b1584ff59b5f7e935f9efa9c148463d810f35b965c39"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v5.2.2/wirtual_5.2.2_linux_amd64.tar.gz"
      sha256 "c3772a5e43fe0655c6a0b62ca6f369dcd7405b4819fc5e378db33211bea2db8b"
    end
  end

  def install
    bin.install "wirtual"
  end

  test do
    system "#{bin}/wirtual", "version"
  end
end
