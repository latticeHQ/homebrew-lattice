# typed: false
# frozen_string_literal: true

class Wirtual < Formula
  desc "A self-hosted remote development platform"
  homepage "https://wirtual.dev"
  version "5.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v5.3.0/wirtual_5.3.0_darwin_arm64.zip"
      sha256 "dc04d8b33854b7dba94ed2a43925a3db29b6bc8c6d67d47f3aa72a12375de574"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v5.3.0/wirtual_5.3.0_darwin_amd64.zip"
      sha256 "1cb5928c34527851b55eacb024a0712e6cdd774fb36983bf38e0aedf13541a3f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v5.3.0/wirtual_5.3.0_linux_arm64.tar.gz"
      sha256 "c1b0595235ea69394086d3b146adbd2a70b32192431e4222340f96cded92e340"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice-runtime/releases/download/v5.3.0/wirtual_5.3.0_linux_amd64.tar.gz"
      sha256 "2dd049f95e917d067f3c2dd378c7961808e1fd12f30cb37bc16d0af9a46ab736"
    end
  end

  def install
    bin.install "wirtual"
  end

  test do
    system "#{bin}/wirtual", "version"
  end
end
