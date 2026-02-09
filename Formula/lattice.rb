# typed: false
# frozen_string_literal: true

class Lattice < Formula
  desc "A self-hosted remote development platform"
  homepage "https://latticeruntime.com"
  version "0.11.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.11.1/lattice_0.11.1_darwin_arm64.zip"
      sha256 "470a2b957f320d420997f6ec940b0355d4c3d284dba71399bd961f8c59b0b251"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.11.1/lattice_0.11.1_darwin_amd64.zip"
      sha256 "4a2ac4f2635a379df9bc1a6b3132da6ec6406cd16be2605ef73fbfe4d7b40e82"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.11.1/lattice_0.11.1_linux_arm64.tar.gz"
      sha256 "078788f890468a853154d20e68802367c9875da215ae3b87b4932d191bd5f3cc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.11.1/lattice_0.11.1_linux_amd64.tar.gz"
      sha256 "d0c7782844a3730516cf4b0edb2e153c57bf90c511044d18251944bfea5021cd"
    end
  end

  def install
    bin.install "lattice"
  end

  test do
    system "#{bin}/lattice", "version"
  end
end
