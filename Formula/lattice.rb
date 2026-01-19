# typed: false
# frozen_string_literal: true

class Lattice < Formula
  desc "Runtime enforcement and identity infrastructure for autonomous AI agents"
  homepage "https://latticeruntime.com"
  version "0.3.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v0.3.2/lattice_0.3.2_darwin_arm64.zip"
      sha256 "5c1b034583c233dbab38111c2edaec974730c2b454fc7c37a7cb502c85de2b16"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v0.3.2/lattice_0.3.2_darwin_amd64.zip"
      sha256 "02c0def1b907b7ed5bf4137fb61c8e1acf150af8d828ed51363650353b653d2f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v0.3.2/lattice_0.3.2_linux_arm64.tar.gz"
      sha256 "a6082058890c4eb2081302fe0ee4274259a8cf23e85734bf6cbe938bede9c5ba"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v0.3.2/lattice_0.3.2_linux_amd64.tar.gz"
      sha256 "cdc3841d0494d3f095820beb071082e6402ac14c94e5520da7f57244913ca43e"
    end
  end

  def install
    bin.install "lattice"
  end

  test do
    system "#{bin}/lattice", "version"
  end
end
