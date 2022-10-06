# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class AssemblyaiCli < Formula
  desc "A quick and easy way to test assemblyAI's transcription features on your terminal"
  homepage "https://www.assemblyai.com/"
  version "0.8"
  license "Apache 2.0"

  on_macos do
    url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v0.8/assemblyai-cli_0.8_darwin_all.tar.gz"
    sha256 "0bba0dafbda12685e68daa9dbe1d089cd2876da46eeb574845a51ec12bff5fa8"

    def install
      bin.install "assemblyai-cli"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v0.8/assemblyai-cli_0.8_linux_arm64.tar.gz"
      sha256 "ae4d6af9bc55bfcc0bdf38433ce5fab2a395cdbc6ddc9d5b28a8e3212bd02256"

      def install
        bin.install "assemblyai-cli"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/AssemblyAI/assemblyai-cli/releases/download/v0.8/assemblyai-cli_0.8_linux_amd64.tar.gz"
      sha256 "9d8a302074a8c45624b9f887dfc3d0eb201efe36aebdddee0b0479bfd4071e16"

      def install
        bin.install "assemblyai-cli"
      end
    end
  end
end
