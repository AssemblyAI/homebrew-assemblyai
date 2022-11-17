# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Assemblyai < Formula
  desc "A quick and easy way to test assemblyAI's transcription features on your terminal"
  homepage "https://www.assemblyai.com/"
  version "1.11"
  license "Apache 2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.11/assemblyai_1.11_darwin_amd64.tar.gz"
      sha256 "4fe9daebc46a38d7413673baf2ff01b43564224bc9d4637e4dbb3d508d2dfed4"

      def install
        bin.install "assemblyai"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.11/assemblyai_1.11_darwin_arm64.tar.gz"
      sha256 "bad61921f21e396a84150a676d12ed54b94fd887c9c5e1a2567517e35e580dac"

      def install
        bin.install "assemblyai"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.11/assemblyai_1.11_linux_amd64.tar.gz"
      sha256 "b1d3a90b3a31c57bd547889f6ef57ef9e12a6e4ce0a8070c99e3ffcb9eeb03e5"

      def install
        bin.install "assemblyai"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.11/assemblyai_1.11_linux_armv6.tar.gz"
      sha256 "f0164689c9af38498b25ecd05adf39b40e74114a1f467af7de6de658b688ae5b"

      def install
        bin.install "assemblyai"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.11/assemblyai_1.11_linux_arm64.tar.gz"
      sha256 "9899cb76030c20e82c18c9b9643659ee9b26ad8cd68b7d22e3a22a8105cbc29f"

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
