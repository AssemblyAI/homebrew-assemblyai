# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Assemblyai < Formula
  desc "A quick and easy way to test assemblyAI's transcription features on your terminal"
  homepage "https://www.assemblyai.com/"
  version "1.17.4"
  license "Apache 2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.17.4/assemblyai_1.17.4_darwin_arm64.tar.gz"
      sha256 "a7f15fe2876633c5ccc9dc16e979afdd71463d95d8b90443c895f6cbe6b03578"

      def install
        bin.install "assemblyai"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.17.4/assemblyai_1.17.4_darwin_amd64.tar.gz"
      sha256 "8d8b296a39fa135c8010bab5423fce1cd5c27296ee912fe8800fbe36997c1035"

      def install
        bin.install "assemblyai"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.17.4/assemblyai_1.17.4_linux_amd64.tar.gz"
      sha256 "1fa1ffe390878cff16ebe88048cdaab22b43b491792c0f7acad6b99932db3d08"

      def install
        bin.install "assemblyai"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.17.4/assemblyai_1.17.4_linux_armv6.tar.gz"
      sha256 "69a641f6c77cb3ece5000338206a79810444d2bc3ba0be3748a46cad189e0be9"

      def install
        bin.install "assemblyai"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v1.17.4/assemblyai_1.17.4_linux_arm64.tar.gz"
      sha256 "591ea2bb97d3f33d241fb480b9c06822f25841ec1dffc3dc42fadde78a40a39a"

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
