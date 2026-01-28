# typed: false
# frozen_string_literal: true

class Lattice < Formula
  desc "A self-hosted remote development platform"
  homepage "https://latticeruntime.com"
  version "0.8.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.8.1/lattice_0.8.1_darwin_arm64.zip"
      sha256 "b3676a236f520f2c9f730020850af2c3343ad88954e9dbb57016ae4427128c87"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.8.1/lattice_0.8.1_darwin_amd64.zip"
      sha256 "377f299d4d916278831a58a92616dc7fa77442983d5661ef03742aebc84fd1f3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.8.1/lattice_0.8.1_linux_arm64.tar.gz"
      sha256 "bce522dc5814a4e3bc596adba4944b416cbe5a69adaf7ae93f6eab4eee195d3d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.8.1/lattice_0.8.1_linux_amd64.tar.gz"
      sha256 "4bb9322582e43046e73ef98944f7044550bdcd4b886e9ae89f393f1db9a10750"
    end
  end

  def install
    bin.install "lattice"
  end

  test do
    system "#{bin}/lattice", "version"
  end
end
