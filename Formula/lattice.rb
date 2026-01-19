# typed: false
# frozen_string_literal: true

class Lattice < Formula
  desc "Runtime enforcement and identity infrastructure for autonomous AI agents"
  homepage "https://latticeruntime.com"
  version "5.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/latticeHQ/latticeRuntime/releases/download/v5.4.0/lattice_5.4.0_darwin_arm64.zip"
      sha256 "b483390cb2645361978ec25b0fec6ebc3f1c26c5589bbda68d579ad52572b296"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/latticeRuntime/releases/download/v5.4.0/lattice_5.4.0_darwin_amd64.zip"
      sha256 "4e3397ef1d172ad1f4ef90f6fc6ec015f804fc2e2040f31a20314e7cc61e6c33"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/latticeHQ/latticeRuntime/releases/download/v5.4.0/lattice_5.4.0_linux_arm64.tar.gz"
      sha256 "c77acd5941247050868e0e195a35f1b2011a56cfba1039f92b1209a32ac03c5d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/latticeRuntime/releases/download/v5.4.0/lattice_5.4.0_linux_amd64.tar.gz"
      sha256 "107a20c97b203fb0d5803fae9fae889f2325371dd23815af5c04aed089726132"
    end
  end

  def install
    bin.install "lattice"
  end

  test do
    system "#{bin}/lattice", "version"
  end
end
