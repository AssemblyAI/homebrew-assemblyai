# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Assemblyai < Formula
  desc "A quick and easy way to test assemblyAI's transcription features on your terminal"
  homepage "https://www.assemblyai.com/"
  version "1.14.1"
  license "Apache 2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.14.1/assemblyai_1.14.1_darwin_amd64.tar.gz"
      sha256 "45549713e51c7daf00c321c515175e69a75565dc00a377c9164cfe876019d950"

      def install
        bin.install "assemblyai"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.14.1/assemblyai_1.14.1_darwin_arm64.tar.gz"
      sha256 "f66458d82d0b0c8a3e3f8b3cf8698cfc53016584917e3a207a7c712902c89bb3"

      def install
        bin.install "assemblyai"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.14.1/assemblyai_1.14.1_linux_armv6.tar.gz"
      sha256 "2d7a42c7c9b1f68b2f87d708326425500009d839a208d6c119dcc2a8d5fab697"

      def install
        bin.install "assemblyai"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.14.1/assemblyai_1.14.1_linux_arm64.tar.gz"
      sha256 "e04bdf9c7b83dde7322d7b362494ab7a151ffdc0ff0069ce3a77227c918cf6e9"

      def install
        bin.install "assemblyai"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.14.1/assemblyai_1.14.1_linux_amd64.tar.gz"
      sha256 "94154afb3534fef1a64672ff9bdbf5e9eb559336f8fb7ba916a274f50d0947eb"

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
