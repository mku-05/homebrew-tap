class AgentSandbox < Formula
  desc "Run Claude Code, OpenAI Codex, or GitHub Copilot CLI in a locked-down Docker sandbox"
  homepage "https://github.com/mku-05/sandbox-agent-ai"
  version "1.1.0"
  url "https://github.com/mku-05/sandbox-agent-ai/releases/download/v1.1.0/agent-sandbox"
  sha256 "bab28be0106c604cdd96e567094baeeeb29f9aaa5de9512c4ff2faf796e3cd46"
  license "MIT"

  def install
    bin.install "agent-sandbox"
    bin.install_symlink "agent-sandbox" => "agent-sandbox.sh"
  end

  def caveats
    <<~CAVEAT
      agent-sandbox requires Docker on the host (the agent CLIs run inside the
      container). If you don't have it:
        https://www.docker.com/
    CAVEAT
  end

  test do
    assert_match "agent-sandbox #{version}", shell_output("#{bin}/agent-sandbox --version")
  end
end
