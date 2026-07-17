class AgentSandbox < Formula
  desc "Run Claude Code, OpenAI Codex, or GitHub Copilot CLI in a locked-down Docker sandbox"
  homepage "https://github.com/mku-05/sandbox-agent-ai"
  version "1.0.0"
  url "https://github.com/mku-05/sandbox-agent-ai/releases/download/v1.0.0/agent-sandbox"
  sha256 "bf77a13d6f67836885da1e4f2fbc7ded8c1bc6c3d3ba97191b215f74da40aa82"
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
