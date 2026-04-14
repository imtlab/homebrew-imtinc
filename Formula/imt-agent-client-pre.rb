class ImtAgentClientPre < Formula
  desc "Prerelease version of the remote management software for IMT Engineers"
  homepage ""
  url "https://mop-agent-releases.s3.us-west-2.amazonaws.com/homebrew/prerelease/imt-agent-client_2026.4.14.3.tar.gz"
  sha256 "73ad8a402221f5a49ef3e9aa8dcd2e169c5afa74d59d0367d088ff594fc19bd3"

  def install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"AgentClient"
    pkgetc.mkpath
    run ["touch", (pkgetc/"agentsettings.json")]
    (prefix/"agentsettings.json").make_relative_symlink(pkgetc/"agentsettings.json")
    (pkgetc/"logs").mkpath
    (prefix/"logs").make_relative_symlink(pkgetc/"logs")
  end

  service do
    run opt_prefix/"AgentClient"
    run_type :immediate
    keep_alive true
  end
end 
