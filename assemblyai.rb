# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Assemblyai < Formula
  desc "A quick and easy way to test assemblyAI's transcription features on your terminal"
  homepage "https://www.assemblyai.com/"
  version "1.8"
  license "Apache 2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.8/assemblyai_1.8_darwin_amd64.tar.gz"
      sha256 "42ab144d4775ae678a5eb115d845cf2d2c48d89560d68d6a94998dbfedcaecad"

      def install
        bin.install "assemblyai"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.8/assemblyai_1.8_darwin_arm64.tar.gz"
      sha256 "64d15bff36fc1f6781b57586c348878db3c780b194365d5ea6ecb1c24a3e57ec"

      def install
        bin.install "assemblyai"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.8/assemblyai_1.8_linux_arm64.tar.gz"
      sha256 "0528c66ae50fd669b6a3c57dc6d51770e68430afda9f6fea5b351ccdb25de2e9"

      def install
        bin.install "assemblyai"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.8/assemblyai_1.8_linux_armv6.tar.gz"
      sha256 "b1851605bce97df35a2e677a81e5c46879e6e5f30920a1bfc1a8731c94dd65fc"

      def install
        bin.install "assemblyai"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.8/assemblyai_1.8_linux_amd64.tar.gz"
      sha256 "ae57cf6a5024ade7a068bb4570cf02cb4999729aa06f7466b43c7d62fb67a626"

      def install
        bin.install "assemblyai"
      end
    end
  end

  test do
    output = shell_output("#{bin}/assemblyai config 1234567890")
    expected = "Invalid token. Try again, and if the problem persists, contact support at support@assemblyai.com"
    assert_match expected, output

    output = shell_output("#{bin}/assemblyai transcribe 1234567890")
    assert_match "You must login first. Run `assemblyai config <token>`\n", output

    output = shell_output("#{bin}/assemblyai get 1234567890")
    assert_match "You must login first. Run `assemblyai config <token>`\n", output
  end
end
