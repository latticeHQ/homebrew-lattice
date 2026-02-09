# typed: false
# frozen_string_literal: true

class Lattice < Formula
  desc "A self-hosted remote development platform"
  homepage "https://latticeruntime.com"
  version "0.11.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.11.0/lattice_0.11.0_darwin_arm64.zip"
      sha256 "4d335c555bff0a55476e4ba61f5134c21086b6eaa47664cb22c8d43d3d238a5a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.11.0/lattice_0.11.0_darwin_amd64.zip"
      sha256 "9795e06395ef65884b3572f730373e663bb5c53fabb16f1b17bc2da9dbcc4d66"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.11.0/lattice_0.11.0_linux_arm64.tar.gz"
      sha256 "b0daea5c6d2b3cbffbe7a9fe3de1c2df0f9a065b517019084bc2d576e9a3d8d8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.11.0/lattice_0.11.0_linux_amd64.tar.gz"
      sha256 "d50c4e0578bed355aa12560e249c5a4b2330008eed719a6f39de99fedf97a745"
    end
  end

  def install
    bin.install "lattice"
  end

  test do
    system "#{bin}/lattice", "version"
  end
end
