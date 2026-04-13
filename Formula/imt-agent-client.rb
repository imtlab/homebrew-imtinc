class ImtAgentClient < Formula
  desc "Remote management software for IMT Engineers"
  homepage ""
  url "https://mop-agent-releases.s3.us-west-2.amazonaws.com/homebrew/prerelease/imt-agent-client-2026.4.9.1.tar.gz"
  sha256 "c5f6a16fae6db0794c1fe123703091482eea8ef5baeda9eac2f6caea3fe86e89"
  version "2026.4.9.1"

  def install
    pkgetc.install Dir["*"]
  end
end  
