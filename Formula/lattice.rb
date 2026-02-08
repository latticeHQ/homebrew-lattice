# typed: false
# frozen_string_literal: true

class Lattice < Formula
  desc "A self-hosted remote development platform"
  homepage "https://latticeruntime.com"
  version "0.10.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.10.2/lattice_0.10.2_darwin_arm64.zip"
      sha256 "0efb02434c644524a1dac08a150b7ef8214f1e52daf11bd1d2d84ca27d77ff0f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.10.2/lattice_0.10.2_darwin_amd64.zip"
      sha256 "ca69e074c87a186fe32e2363a6fac6527fcae50b6c390188d5ed114a8da11724"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.10.2/lattice_0.10.2_linux_arm64.tar.gz"
      sha256 "e5560487d8cefba5672687b3384f28d72b30982a59caef71a94e3c615e710e2c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice/releases/download/v0.10.2/lattice_0.10.2_linux_amd64.tar.gz"
      sha256 "440e67b0619ca5d5ce3327fbf74b22bf24b6dcfb62a110d7db06b6eeeaa44dbd"
    end
  end

  def install
    bin.install "lattice"
  end

  test do
    system "#{bin}/lattice", "version"
  end
end
