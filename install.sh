#!/bin/bash
# MTProxyMax Quick Installer — SamNet Technologies
# Usage: curl -sL https://raw.githubusercontent.com/nellimonix/MTProxyMaxX/main/install.sh | sudo bash
#
# Optional environment variables for non-interactive installs:
#   MTPROXY_SECRET  — custom 32-char hex secret (ee/dd prefix and domain hex are stripped automatically)
#   MTPROXY_LABEL   — label for the initial secret (default: "default")
#   MTPROXY_PORT    — proxy port (default: 443)
#   MTPROXY_DOMAIN  — FakeTLS domain (default: cloudflare.com)
#
# Example with custom secret:
#   curl -sL https://raw.githubusercontent.com/nellimonix/MTProxyMaxX/main/install.sh \
#     | sudo MTPROXY_SECRET=000102030405060708090a0b0c0d0e0f MTPROXY_LABEL=alice bash
set -e
SCRIPT_URL="https://raw.githubusercontent.com/nellimonix/MTProxyMaxX/refs/heads/main/mtproxymax.sh"
if [ "$(id -u)" -ne 0 ]; then echo "Run as root: curl -sL $SCRIPT_URL | sudo bash" >&2; exit 1; fi
curl -fsSL "$SCRIPT_URL" -o /tmp/mtproxymax.sh && \
  MTPROXY_SECRET="${MTPROXY_SECRET:-}" \
  MTPROXY_LABEL="${MTPROXY_LABEL:-}" \
  MTPROXY_PORT="${MTPROXY_PORT:-}" \
  MTPROXY_DOMAIN="${MTPROXY_DOMAIN:-}" \
  bash /tmp/mtproxymax.sh install && rm -f /tmp/mtproxymax.sh
