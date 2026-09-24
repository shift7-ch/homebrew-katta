# Homebrew formula template for the Katta Admin CLI.
# .github/workflows/release.yml substitutes 1.0.4 and 35df06ce72980c38b755bf0296a5099164eea93cc42e7c9e151ecc795f4597cb
# on tag builds and pushes the result to shift7-ch/homebrew-katta as Formula/katta.rb.
class Katta < Formula
  desc "Admin CLI to configure a Katta Server including its S3 storage backend"
  homepage "https://katta.cloud/"
  version "1.0.4"
  license "AGPL-3.0-or-later"

  # Native image is currently built for Apple Silicon only.
  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/shift7-ch/katta-admin-cli/releases/download/#{version}/katta-macos-arm64.tar.gz"
  sha256 "35df06ce72980c38b755bf0296a5099164eea93cc42e7c9e151ecc795f4597cb"

  def install
    bin.install "katta"
    generate_completions_from_executable(bin/"katta", "completion", shells: [:bash],
                                         shell_parameter_format: :arg)
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/katta --help")
  end
end
