# Homebrew formula template for the Katta Admin CLI.
# .github/workflows/release.yml substitutes 1.0.3 and 411f1b3c5b073e9842fff1d3e13c42263da8f664c557cb40cbe7149c6367928f
# on tag builds and pushes the result to shift7-ch/homebrew-katta as Formula/katta.rb.
class Katta < Formula
  desc "Admin CLI to configure a Katta Server including its S3 storage backend"
  homepage "https://katta.cloud/"
  version "1.0.3"
  license "AGPL-3.0-or-later"

  # Native image is currently built for Apple Silicon only.
  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/shift7-ch/katta-admin-cli/releases/download/#{version}/katta-macos-arm64.tar.gz"
  sha256 "411f1b3c5b073e9842fff1d3e13c42263da8f664c557cb40cbe7149c6367928f"

  def install
    bin.install "katta"
    generate_completions_from_executable(bin/"katta", "completion", shells: [:bash],
                                         shell_parameter_format: :arg)
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/katta --help")
  end
end
