# Seed formula for the Katta Admin CLI.
#
# This file is normally rendered and force-pushed by the cli.yml workflow in
# shift7-ch/katta-clientlib on every tagged release, pinned to that release's
# katta-macos-arm64.tar.gz and its sha256. It is checked in here by hand so the
# tap is usable before the first release built by that workflow; the next tagged
# release will overwrite it.
#
# The 1.0.0 release predates the packaging workflow and ships a single bare
# arm64 Mach-O binary named "katta" rather than a tarball, so this formula
# points straight at that asset and omits the shell-completion wiring the
# rendered template carries.
class Katta < Formula
  desc "Admin CLI to configure a Katta Server including its S3 storage backend"
  homepage "https://katta.cloud/"
  version "1.0.0"
  license "AGPL-3.0-or-later"

  # Native image is currently built for Apple Silicon only.
  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/shift7-ch/katta-clientlib/releases/download/1.0.0/katta"
  sha256 "30a5b46b429b7351da0c63888b222379a73d9b86f2929dc0bac22bbbf113016b"

  def install
    bin.install "katta"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/katta --help")
  end
end
