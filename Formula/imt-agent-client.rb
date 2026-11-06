class ImtAgentClient < Formula
  desc "Stable version of the remote management software for IMT Engineers"
  homepage ""
  url "https://mop-agent-releases.s3.us-west-2.amazonaws.com/homebrew/stable/imt-agent-client_2026.11.6.2.tar.gz"
  sha256 "b4afd4377d423830f884060b0b84ef561be5f62af03c780865e19c6f03bc2bf4"

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
    environment_variables PATH: ((std_service_path_env) + ":/usr/local/bin")
    require_root true
  end
end 
