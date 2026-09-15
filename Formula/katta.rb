# Homebrew formula template for the Katta Admin CLI.
# .github/workflows/release.yml substitutes 1.0.2 and 93f3b6bf31ee6fac9a59bb44a78686ce765412dea651b9ab3f5ba01689cad6c5
# on tag builds and pushes the result to shift7-ch/homebrew-katta as Formula/katta.rb.
class Katta < Formula
  desc "Admin CLI to configure a Katta Server including its S3 storage backend"
  homepage "https://katta.cloud/"
  version "1.0.2"
  license "AGPL-3.0-or-later"

  # Native image is currently built for Apple Silicon only.
  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/shift7-ch/katta-admin-cli/releases/download/#{version}/katta-macos-arm64.tar.gz"
  sha256 "93f3b6bf31ee6fac9a59bb44a78686ce765412dea651b9ab3f5ba01689cad6c5"

  def install
    bin.install "katta"
    generate_completions_from_executable(bin/"katta", "completion", shells: [:bash],
                                         shell_parameter_format: :arg)
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/katta --help")
  end
end
