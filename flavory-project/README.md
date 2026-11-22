# Flavory
A recipe discovery and cooking companion built with React + Vite.

## Run locally
1. Install Node.js LTS.
2. In this folder run `npm install`
3. Run `npm run dev`
4. Open the local URL shown in the terminal.

## Deploy
Push this folder to GitHub, import the repository into Vercel, and deploy.
Vercel detects Vite automatically.

## Optional Supabase
Create a Supabase project, copy `.env.example` to `.env`, and fill:
- `VITE_SUPABASE_URL`
- `VITE_SUPABASE_ANON_KEY`

Run `supabase-schema.sql` in Supabase SQL Editor to create user data tables.
If env values are absent, Flavory runs in Guest/local mode.

## Image note
Recipe cards use remote image URLs and fallback gradients. Remote providers may change URLs or hotlink rules. For production, replace image URLs with images you have permission to use, or use a properly configured image API/storage provider. No API keys are included.
