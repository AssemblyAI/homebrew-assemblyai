# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Assemblyai < Formula
  desc "A quick and easy way to test assemblyAI's transcription features on your terminal"
  homepage "https://www.assemblyai.com/"
  version "1.15"
  license "Apache 2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.15/assemblyai_1.15_darwin_arm64.tar.gz"
      sha256 "de8eb75127dae35212e1a21166a42e5150e0a3713a3189a8949f6603efa186da"

      def install
        bin.install "assemblyai"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.15/assemblyai_1.15_darwin_amd64.tar.gz"
      sha256 "b42249736111a3ccac0deab8c9f6cc255ad07e8bc1c936a8084137ae24bd3989"

      def install
        bin.install "assemblyai"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.15/assemblyai_1.15_linux_armv6.tar.gz"
      sha256 "c5eaba163cf3cf59fe7465c865bfb96d74c27ab0ce9e6a76f28e5baf02a6d8fe"

      def install
        bin.install "assemblyai"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.15/assemblyai_1.15_linux_arm64.tar.gz"
      sha256 "c14fabf51f19d8dc18d2ac32bf951e97a86fd3723785ecc476e16309c3849a20"

      def install
        bin.install "assemblyai"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.15/assemblyai_1.15_linux_amd64.tar.gz"
      sha256 "bfd4e89a29ff5f9ce2ccfa07249f90ebcf5f9af3a60f4fd532c725280df6bfa3"

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
