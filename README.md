# Fridge Freezer Inventory

A visual inventory for a fridge freezer and a deep freezer: tap a shelf or drawer to add or remove items,
set use by dates, and keep a shared shopping list. No login: everyone with the link sees the same data.

## Files
- `index.html` — the whole app
- `config.js` — your Supabase connection details
- `supabase-setup.sql` — creates the database table (run once)

## Setup
1. **Database:** create a free project at https://supabase.com. In the SQL Editor, run `supabase-setup.sql`.
   Then copy the Project URL and the `anon` `public` key (Project Settings → API) into `config.js`.
2. **Hosting:** in this GitHub repo go to Settings → Pages → Build and deployment → Source: *Deploy from a branch*,
   Branch: `main`, folder `/ (root)`. The site appears at `https://<your-username>.github.io/<repo-name>/`.

Anyone with the link can change the inventory, so only share it with people you trust.
