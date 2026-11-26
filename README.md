# Solidity & Foundry Security Gate Starter (SARIF 2.1.0 + MCP Firewall)

[![ChainGuard Security Gate](https://github.com/EzequielLech/solidity-sarif-security-starter/actions/workflows/security.yml/badge.svg)](https://github.com/EzequielLech/solidity-sarif-security-starter/actions/workflows/security.yml)
[![GitHub Marketplace](https://img.shields.io/badge/Marketplace-ChainGuard%20Web3%20%26%20MCP%20Security%20Gate-10b981.svg)](https://github.com/marketplace/actions/chainguard-web3-mcp-security-gate)
[![Audit Status](https://chainguard-studio-production.up.railway.app/api/v1/badge/aud_8786523d58a5.svg)](https://chainguard-studio-production.up.railway.app/certificate/aud_8786523d58a5)
[![MCP: 2025-06-18](https://img.shields.io/badge/MCP-Pre--Wired%20IDE%20Firewall-38bdf8.svg)](https://chainguard-studio-production.up.railway.app/mcp)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

Click **Use this template** above to bootstrap a hardened **Solidity 0.8.24 / Foundry** repository with automated **Pull Request Security Gates**, **OASIS SARIF 2.1.0 Code Scanning**, and a pre-configured **15-Tool Web3 Security MCP Server** for Cursor, Claude Code, Windsurf, and OpenCode.

Every push and pull request automatically scans Solidity smart contracts, deployment scripts, and `.mcp.json` configurations for `tx.origin` auth bypasses, `selfdestruct`, unchecked `delegatecall`, reentrancy patterns, invisible zero-width Unicode tool poisoning, prompt injections, and leaked private keys.

---

## Included Out of the Box

| Path | Description |
|---|---|
| [`src/TreasuryVault.sol`](src/TreasuryVault.sol) | Reference Solidity 0.8.24 vault implementing Checks-Effects-Interactions, custom errors, and `nonReentrant` guards |
| [`foundry.toml`](foundry.toml) | Ready-to-build Foundry configuration (`solc 0.8.24`, optimizer enabled) |
| [`.github/workflows/security.yml`](.github/workflows/security.yml) | Zero-dependency CI gate running [`EzequielLech/chainguard-mcp@v1.4.1`](https://github.com/marketplace/actions/chainguard-web3-mcp-security-gate) with SARIF 2.1.0 export |
| [`.mcp.json`](.mcp.json) | Pre-wired remote MCP security server (`/mcp`) for real-time AI IDE code & transaction auditing |

---

## Quickstart

### 1. Create Your Repository from This Template

Click **Use this template -> Create a new repository** on GitHub, or clone via GitHub CLI:

```bash
gh repo create my-defi-protocol --template EzequielLech/solidity-sarif-security-starter --public --clone
cd my-defi-protocol
```

### 2. Build Contracts with Foundry (Optional Local Toolchain)

```bash
forge build
```

### 3. Run the Zero-Dependency CLI Scanner Locally

```bash
pip install git+https://github.com/EzequielLech/chainguard-mcp.git
chainguard-mcp scan-dir . --markdown --fail-on-block
```

### 4. Instant 1-Click Public GitHub Repo Audit

Paste your `owner/repo` URL directly into the [ChainGuard Security Console](https://chainguard-studio-production.up.railway.app/#console) or call the public API to generate a live risk score, audit certificate, and dynamic SVG badge:

```bash
curl -X POST https://chainguard-studio-production.up.railway.app/api/v1/scan/github-repo \
  -H "Content-Type: application/json" \
  -d '{"repo": "EzequielLech/solidity-sarif-security-starter"}'
```

---

## Production Security Upgrades (1-Click Multi-Chain Settlement — No KYC)

Preparing for mainnet launch, investor due diligence, or grant review? Upgrade directly on-chain (`USDC`, `USDT`, `ETH`, `BNB`, `POL`, `SOL`, or `BTC`):

- **[On-Chain Verified SVG Security Badge + Certificate ($19 One-Time)](https://chainguard-studio-production.up.railway.app/solidity-security-audit-badge)** — Unlocks the emerald `ChainGuard Verified` README badge and cryptographically verifiable audit certificate page.
- **[24/7 DeFi Frontend Drainer & EIP-1967 Proxy Watchdog ($29/mo)](https://chainguard-studio-production.up.railway.app/#console)** — Continuous 5-minute SHA-256 script baseline monitoring and proxy implementation slot checks with instant Telegram/Webhook alerts.
- **[Investor Audit & Remediation Dossier + 5,000 Pro Calls ($49)](https://chainguard-studio-production.up.railway.app/#console)** — Downloadable Markdown/SARIF remediation bundle plus a 5,000-call `cg_live_...` API/MCP key.
- **Full Action & MCP Documentation:** [github.com/EzequielLech/chainguard-mcp](https://github.com/EzequielLech/chainguard-mcp)
