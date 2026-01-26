# typed: false
# frozen_string_literal: true

class Lattice < Formula
  desc "A self-hosted remote development platform"
  homepage "https://latticeruntime.com"
  version "0.7.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v0.7.1/lattice_0.7.1_darwin_arm64.zip"
      sha256 "551f3ea140cb3a0912353709219a801a355c3e7bd6c2cd4a56528106256b752c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v0.7.1/lattice_0.7.1_darwin_amd64.zip"
      sha256 "4104e0ebeb40d17b61d36544a737595ed5fd6ab3a2a45a592fa19ed864837980"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v0.7.1/lattice_0.7.1_linux_arm64.tar.gz"
      sha256 "aa6fe73005956ce400cdaea07159829ab98584bba47b60603fed40f064ac5bd8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v0.7.1/lattice_0.7.1_linux_amd64.tar.gz"
      sha256 "9e138e528c4759e8ae7cb91863a906019f8f02aa64a270c29da9dfb27fcdd9fe"
    end
  end

  def install
    bin.install "lattice"
  end

  test do
    system "#{bin}/lattice", "version"
  end
end
