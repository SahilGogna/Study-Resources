# Telegram Bot Setup (OpenClaw) — End-to-end Notes

This README documents the exact flow we followed to get Telegram working with OpenClaw inside Docker, from finding the right container through successfully chatting.

## 0) Prereqs

- You have SSH access to the VPS host.
- OpenClaw is running in Docker.
- You have created a Telegram bot via **@BotFather**.

## 1) Create / rotate the Telegram bot token

1. Open Telegram → **@BotFather**
2. Create a bot (if needed):
   - `/newbot`
   - choose name + username (must end in `bot`)
3. If you already exposed a token anywhere, rotate it:
   - `/revoke` (revokes the previous token)
   - `/token` (generates a new token)

> Keep the token out of chat logs. Prefer writing it to a file on the server.

## 2) Identify the OpenClaw container

On the VPS host:

```bash
docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}"
```

In our case:

- Container: `openclaw-dazq-openclaw-1`
- Image: `ghcr.io/hostinger/hvps-openclaw:latest`

## 3) Enter the container

```bash
docker exec -it openclaw-dazq-openclaw-1 sh
```

Confirm OpenClaw is present:

```sh
which openclaw
ls -la /data/.openclaw
```

## 4) Store the bot token in a file (recommended)

Create the token file in the container:

```sh
mkdir -p /data/.openclaw/credentials
nano /data/.openclaw/credentials/telegram.token
chmod 600 /data/.openclaw/credentials/telegram.token
```

- File path used: `/data/.openclaw/credentials/telegram.token`
- Permissions: `0600`

### Verify the token works (safe check)

This does **not** print the token, only Telegram's response:

```sh
curl -s "https://api.telegram.org/bot$(cat /data/.openclaw/credentials/telegram.token)/getMe"
```

Expected: `"ok":true`.

## 5) Configure OpenClaw to use `tokenFile`

We set OpenClaw's Telegram config to read the token from the file:

- `channels.telegram.tokenFile: /data/.openclaw/credentials/telegram.token`

(Instead of pasting the token into `openclaw.json`.)

After updating config, restart OpenClaw.

### Restart

```sh
openclaw gateway restart
```

## 6) Confirm Telegram channel health

From inside the container:

```sh
openclaw channels status --probe --timeout 30000
```

Expected:

- Telegram: `enabled, configured, running, mode:polling, bot:@<your_bot>, token:tokenFile, works`

If you see `401 Unauthorized`, the token is wrong/revoked or the file path is wrong.

## 7) Pairing / allowlist (why "hi" didn't respond at first)

OpenClaw Telegram was configured with:

- `dmPolicy: pairing`

That means the first DM creates a pairing request and you may not get a reply until your Telegram user is allowed.

### Inspect pairing requests

```sh
cat /data/.openclaw/credentials/telegram-pairing.json
```

This file includes your Telegram **userId**.

## 8) Temporary "open" mode to capture userId (optional but useful)

We temporarily switched to open DMs to ensure messages pass through while identifying the correct userId:

- `dmPolicy: open`
- `allowFrom: ['*']`

Then restarted.

Once we confirmed the correct Telegram userId, we locked it down again.

## 9) Lock Telegram DMs to a specific userId (final state)

We confirmed the userId from `telegram-pairing.json` and then set:

- `dmPolicy: pairing`
- `allowFrom: ['8377261662']`  
  (Replace with *your* Telegram userId.)

Restarted OpenClaw.

## 10) Validate the chat

On Telegram:

1. Open the bot (e.g. `@hostinger_sahil_123_bot`)
2. Tap **Start**
3. Send: `hi`

At this point, OpenClaw should respond and the chat is live.

---

## Troubleshooting

### A) `openclaw: command not found`

You're likely in the wrong container. Re-run `docker ps` and exec into the OpenClaw container.

### B) Token file missing

If `cat /data/.openclaw/credentials/telegram.token` says "No such file", the file was created in the wrong container or wrong path.

### C) Telegram 401 Unauthorized

- Token is invalid/revoked
- Token has whitespace/newline issues
- Wrong bot token

Use the `getMe` curl check to confirm.

### D) Group messages not working

If you keep `groupPolicy: allowlist`, you must set one of:

- `channels.telegram.groupAllowFrom`
- `channels.telegram.allowFrom`

Otherwise group messages will be dropped.
