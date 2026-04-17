class ImtAgentClientPre < Formula
  desc "Prerelease version of the remote management software for IMT Engineers"
  homepage ""
  url "https://mop-agent-releases.s3.us-west-2.amazonaws.com/homebrew/prerelease/imt-agent-client_2026.4.17.1.tar.gz"
  sha256 "6175fd3ac969b556b430c74bdfb65acc9dc68f3c4df8aa9b8a075dd129af7977"

  def install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"AgentClient"
    pkgetc.mkpath
    #run ["touch", (pkgetc/"agentsettings.json")]
    (prefix/"agentsettings.json").make_relative_symlink(pkgetc/"agentsettings.json")
    (pkgetc/"logs").mkpath
    (prefix/"logs").make_relative_symlink(pkgetc/"logs")
  end

  service do
    run opt_prefix/"AgentClient"
    run_type :immediate
    keep_alive true
    environment_variables PATH: std_service_path_env
    require_root true
  end
end 
