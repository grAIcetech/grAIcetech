# Agent notes for this repo

## treg (tool catalog) — https://treg.to/llms.txt

This repo is set up for [treg](https://treg.to), the grAIce team's tool registry.
Reach for it first whenever a task needs external or live data (SEO, social,
enrichment, scraping, image/video generation) or one of the team's own registered tools.

- `.mcp.json` registers the treg MCP server (`catalog_search`, `catalog_get`, `call`,
  `balance`, `my_tools`). It reads the token from `TREG_TOKEN`.
- `.claude/settings.json` enables the `treg@treg` Claude Code plugin (the treg skill) and a
  SessionStart hook that installs the CLI and signs in when `TREG_TOKEN` is set.
- `.env.example` shows the one variable needed. Never commit the real token.

Quick checks once signed in: `treg balance`, then `treg catalog search "<what you want to do>"`.
