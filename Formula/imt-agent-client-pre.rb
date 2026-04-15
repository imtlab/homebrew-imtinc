class ImtAgentClientPre < Formula
  desc "Prerelease version of the remote management software for IMT Engineers"
  homepage ""
  url "https://mop-agent-releases.s3.us-west-2.amazonaws.com/homebrew/prerelease/imt-agent-client_2026.4.15.1.tar.gz"
  sha256 "b9ed881de37c2359fb4656c74efd6980f414f25f292feadcba787aaaef8e89d5"

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

  def post_install
    system "brew", "services", "restart", "imt-agent-client-pre"
  end  
end 
