DARSHAN PATTERNS — FREE DEPLOYMENT KIT

What this package does
- Shutterstock-inspired responsive gallery: 7 columns wide desktop, 6 smaller desktop, 4 tablet/mobile.
- Search, category filter, sort, preview modal and watermark overlay.
- Buy Now opens WhatsApp +91 7862899424 with product details.
- Admin login and preview image upload using Supabase Auth + Storage + Database.
- No TIFF upload, no checkout and no payment gateway.

IMPORTANT: I cannot publish this into your personal accounts from this chat. You must create/connect the free accounts and publish. GitHub Pages + Supabase free tiers are intended for a no-cost start, subject to provider limits and terms.

SETUP
A) Supabase (free account)
1. Create a project at https://supabase.com and choose the free plan.
2. In Project Settings > API, copy Project URL and anon/public key.
3. Open SQL Editor, paste all contents of supabase_setup.sql, and run it.
4. In Authentication > Providers, ensure Email is enabled.
5. In Authentication > Users, add an admin user with email: maisuriadarshan2@gmail.com. Set a password only inside Supabase. Confirm the user if required.
6. In index.html, replace:
   PASTE_SUPABASE_PROJECT_URL with your Project URL
   PASTE_SUPABASE_ANON_KEY with your anon/public key
   Never put a service_role key in this website.

B) GitHub Pages (free public website)
1. Create/sign in to https://github.com.
2. Create a public repository named darshan-patterns.
3. Upload index.html to the repository root.
4. Open repository Settings > Pages.
5. Under Build and deployment, select Deploy from a branch, choose main and /(root), then Save.
6. GitHub will show the live URL, normally https://YOUR-USERNAME.github.io/darshan-patterns/

C) Admin use
1. Open the live URL and tap ADMIN LOGIN.
2. Sign in with maisuriadarshan2@gmail.com and the password you set in Supabase.
3. Upload JPG/PNG/WebP preview images, enter name/category/price and publish.
4. New listings appear in the public gallery.
5. Delete listings from the dashboard.

Security notes
- The Supabase anon/public key is designed for browser use; database and storage Row Level Security policies in supabase_setup.sql restrict write operations to the configured admin email.
- Never expose a Supabase service_role key or your account password.
- Change the admin email in BOTH index.html and SQL policies before running setup if you want a different email.
- Watermark here is a visible overlay, not tamper-proof image protection. Upload suitably sized preview images with your own watermark baked in if stronger protection is needed.
- This starter allows add/delete. Editing an existing listing's title/category/price can be added next; currently delete and re-upload is the supported replacement workflow.
- This is a first deployment kit; test login, upload, mobile layout and WhatsApp link before sharing publicly.
