# typed: false
# frozen_string_literal: true

class Wirtual < Formula
  desc "A self-hosted remote development platform"
  homepage "https://wirtual.dev"
  version "5.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v5.1.1/wirtual_5.1.1_darwin_arm64.zip"
      sha256 "9cd53be8e6af7bfab1d63781448c0f4fed54ab54300d7dd73994019eb20f4b63"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v5.1.1/wirtual_5.1.1_darwin_amd64.zip"
      sha256 "3e047daed6d1d4a1c6b9309d386ec9eb337eb4e669af4e78770846438fa44bae"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v5.1.1/wirtual_5.1.1_linux_arm64.tar.gz"
      sha256 "ecffb0ce700ef9e49e7c89c50ec0d5fe297b7e324205c2420953dba9a9383892"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v5.1.1/wirtual_5.1.1_linux_amd64.tar.gz"
      sha256 "e849f58843fe328d8b9b579d9f85645f97512736dd4a782ba90ec8e6fc9a4f7e"
    end
  end

  def install
    bin.install "wirtual"
  end

  test do
    system "#{bin}/wirtual", "version"
  end
end
