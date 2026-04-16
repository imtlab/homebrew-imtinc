class ImtAgentClientPre < Formula
  desc "Prerelease version of the remote management software for IMT Engineers"
  homepage ""
  url "https://mop-agent-releases.s3.us-west-2.amazonaws.com/homebrew/prerelease/imt-agent-client_2026.4.16.3.tar.gz"
  sha256 "111cdefad3853d14a8c1bc2ec7b5cd90ee3952befe1830189b15c4c62168f068"

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
  end
end 
