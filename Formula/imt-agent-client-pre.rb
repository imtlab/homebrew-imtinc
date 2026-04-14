class ImtAgentClientPre < Formula
  desc "Prerelease version of the remote management software for IMT Engineers"
  homepage ""
  url "https://mop-agent-releases.s3.us-west-2.amazonaws.com/homebrew/prerelease/imt-agent-client_2026.4.14.1.tar.gz"
  sha256 "58baa15038d4623636733a9de3002a108d7006a32049fab3e267aa659afec1b2"

  def install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"AgentClient"
    pkgetc.mkpath
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
