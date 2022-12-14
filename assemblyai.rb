# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Assemblyai < Formula
  desc "A quick and easy way to test assemblyAI's transcription features on your terminal"
  homepage "https://www.assemblyai.com/"
  version "1.14.2"
  license "Apache 2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.14.2/assemblyai_1.14.2_darwin_arm64.tar.gz"
      sha256 "b33aa93899397549a5120296858525f171c354dcee13e2908ef83e40d463032c"

      def install
        bin.install "assemblyai"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.14.2/assemblyai_1.14.2_darwin_amd64.tar.gz"
      sha256 "1d8076326bec262f372de032a437f144036dad882fed895e5ff55bf6ac35a744"

      def install
        bin.install "assemblyai"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.14.2/assemblyai_1.14.2_linux_amd64.tar.gz"
      sha256 "bd06476cae64c157a32752c243d570bcdc7571d54047b036cd55cfc25d0401fa"

      def install
        bin.install "assemblyai"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.14.2/assemblyai_1.14.2_linux_arm64.tar.gz"
      sha256 "2c5965fa71385bf77ea42c55ff5af1860b0bdf9ed29132509f10c1c0952bd516"

      def install
        bin.install "assemblyai"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.14.2/assemblyai_1.14.2_linux_armv6.tar.gz"
      sha256 "547fecc1ce606187ac906357aa151cc8bd916d2a4cbad73cb9e548c1c7c83edc"

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
