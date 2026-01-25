# typed: false
# frozen_string_literal: true

class Lattice < Formula
  desc "A self-hosted remote development platform"
  homepage "https://latticeruntime.com"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v0.6.0/lattice_0.6.0_darwin_arm64.zip"
      sha256 "2651ed18de5fd8fed1635a52c206365d5b02dec801c5f7717e162f1081377d8c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v0.6.0/lattice_0.6.0_darwin_amd64.zip"
      sha256 "ce67331576dbbac4abaac994e5cc3a8dad2078ab71a7acb6ba3eceeda0334aa8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v0.6.0/lattice_0.6.0_linux_arm64.tar.gz"
      sha256 "62cb2a80a80f6f07807d80efc17e6bb4309f95cd201b4d0dd582cfb866e0ed68"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v0.6.0/lattice_0.6.0_linux_amd64.tar.gz"
      sha256 "88cf664307aae02b322db34ffac2ae9b13b4d20baaa1a31cccedeb47a3978785"
    end
  end

  def install
    bin.install "lattice"
  end

  test do
    system "#{bin}/lattice", "version"
  end
end
