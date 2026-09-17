#!/bin/sh
# treg session bootstrap — https://treg.to/llms.txt
#
# Runs at Claude Code session start. Installs the treg CLI and signs in with the
# team token, so the agent can call the treg catalog and the grAIce team's tools.
#
# Requires TREG_TOKEN in the environment (Claude Code web: environment variables;
# local: a .env or shell export). Without it this script does nothing.
# Never commit the token — it identifies the grAIce team on every call.
set -u

if [ -z "${TREG_TOKEN:-}" ]; then
  echo "treg: TREG_TOKEN not set — skipping treg setup"
  exit 0
fi

export PATH="$HOME/.local/bin:$PATH"

if ! command -v treg >/dev/null 2>&1; then
  # Official installer: installs the CLI + skill, signs in, and registers the MCP server.
  # Needs network access to treg.to and pypi.org.
  curl -fsSL https://treg.to/install.sh | sh -s -- --token "$TREG_TOKEN" || {
    echo "treg: install failed (is treg.to reachable from this environment?)"
    exit 0
  }
else
  treg login --token "$TREG_TOKEN" >/dev/null 2>&1 || echo "treg: could not verify token"
fi

treg balance 2>/dev/null || true
