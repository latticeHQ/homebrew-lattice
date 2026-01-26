# typed: false
# frozen_string_literal: true

class Lattice < Formula
  desc "Runtime enforcement and identity infrastructure for autonomous AI agents"
  homepage "https://latticeruntime.com"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.7.0/lattice_0.7.0_darwin_arm64.zip"
      sha256 "7bc9898cdf8158c53e4b5b7080956fa22fd4692fac28139908182d31f8006dc8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.7.0/lattice_0.7.0_darwin_amd64.zip"
      sha256 "03f8ee993d0826e6d71d5d607783b6fd4819eb76e293aaf97b1970d891ef3803"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.7.0/lattice_0.7.0_linux_arm64.tar.gz"
      sha256 "85ba83ea81bbce37c18e34573cb68c7b9116584d99ddab2ad908e74d3b2068ea"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.7.0/lattice_0.7.0_linux_amd64.tar.gz"
      sha256 "d561fed57ec6f9b2ddf3d53c6c2b9e315fba4b30b6630460ba0a095ddc476302"
    end
  end

  def install
    bin.install "lattice"
  end

  test do
    system "#{bin}/lattice", "version"
  end
end
