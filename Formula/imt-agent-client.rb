class ImtAgentClientPre < Formula
  desc "Stable version of the remote management software for IMT Engineers"
  homepage ""
  url "https://mop-agent-releases.s3.us-west-2.amazonaws.com/homebrew/stable/imt-agent-client_2026.4.28.1.tar.gz"
  sha256 "5cbbce29f6bdf250838a47ff8281c89e3292cd44a97413be4a5881fd61cc5a2b"

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
