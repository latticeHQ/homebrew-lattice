#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -ne 5 ]; then
  echo "Usage: $0 <version> <darwin_arm_sha> <darwin_intel_sha> <linux_arm_sha> <linux_amd_sha>"
  exit 1
fi

VERSION=$1
DARWIN_ARM_SHA=$2
DARWIN_INTEL_SHA=$3
LINUX_ARM_SHA=$4
LINUX_AMD_SHA=$5

# Update Formula/lattice.rb
cat > Formula/lattice.rb << EOF
# typed: false
# frozen_string_literal: true

class Lattice < Formula
  desc "Runtime enforcement and identity infrastructure for autonomous AI agents"
  homepage "https://latticeruntime.com"
  version "${VERSION}"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/latticeHQ/lattice/releases/download/v${VERSION}/lattice_${VERSION}_darwin_arm64.zip"
      sha256 "${DARWIN_ARM_SHA}"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice/releases/download/v${VERSION}/lattice_${VERSION}_darwin_amd64.zip"
      sha256 "${DARWIN_INTEL_SHA}"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/latticeHQ/lattice/releases/download/v${VERSION}/lattice_${VERSION}_linux_arm64.tar.gz"
      sha256 "${LINUX_ARM_SHA}"
    end
    if Hardware::CPU.intel?
      url "https://github.com/latticeHQ/lattice/releases/download/v${VERSION}/lattice_${VERSION}_linux_amd64.tar.gz"
      sha256 "${LINUX_AMD_SHA}"
    end
  end

  def install
    bin.install "lattice"
  end

  test do
    system "#{bin}/lattice", "version"
  end
end
EOF

echo "Formula updated for version ${VERSION}"
