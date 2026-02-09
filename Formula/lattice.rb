# typed: false
# frozen_string_literal: true

class Lattice < Formula
  desc "A self-hosted remote development platform"
  homepage "https://latticeruntime.com"
  version "0.11.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.11.3/lattice_0.11.3_darwin_arm64.zip"
      sha256 "9daa3afac640556bc6659a392ba23fcd98386b1e5cdd13adb9a70e6f48ed1eb2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.11.3/lattice_0.11.3_darwin_amd64.zip"
      sha256 "a63cce978856661fd62f6619ccc11ff70484945797f4f5690f432f0f8f7f1044"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.11.3/lattice_0.11.3_linux_arm64.tar.gz"
      sha256 "398f055bf781a3a440cea96d0aad35de23d5fdabe793a23487ebad2e228443ed"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.11.3/lattice_0.11.3_linux_amd64.tar.gz"
      sha256 "401429dd4b3a33b150b7638f32c0d97ac915798bcef443e5c282dc9f252cef78"
    end
  end

  def install
    bin.install "lattice"
  end

  test do
    system "#{bin}/lattice", "version"
  end
end
