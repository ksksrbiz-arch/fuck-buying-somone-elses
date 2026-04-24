# Field Bulletin №001 — Deploy Package

Static site. No build step. Three ways to ship:

## 1. One-shot script (fastest, requires CLI)

```bash
./deploy.sh
```

First run opens a browser tab for Cloudflare OAuth. After that it's a single command. Lands at `https://field-bulletin-001.pages.dev`.

## 2. Manual wrangler

```bash
npx wrangler@latest pages deploy . --project-name=field-bulletin-001
```

## 3. Cloudflare dashboard (no CLI)

dash.cloudflare.com → Workers & Pages → Create → Pages → Upload assets → drag this whole folder in.

## Files

- `index.html` — the site
- `Ag_Drone_Bootstrap_Plan.mp4` — 90-sec video (13MB)
- `Starting_an_Ag_Drone_Business.mp4` — long-form video (40MB)
- `Precision_Drone_Playbook.pdf` — 15-slide deck (21MB)
- `wrangler.toml` — Cloudflare Pages config
- `deploy.sh` — wrapper script

## Limits to know

- Cloudflare Pages: 25MB per file, 25k files per deploy. Both videos are under 25MB. Safe.
- If a file ever crosses 25MB → swap to R2 or Cloudflare Stream.

## Custom domain

After first deploy: dash → Workers & Pages → field-bulletin-001 → Custom domains → Set up. Works with anything in your Cloudflare zone (1commerce.online subdomain etc.).
