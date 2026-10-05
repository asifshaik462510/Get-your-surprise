# Birthday Surprise v2.1 — Supabase setup

This version fixes the old huge-URL problem. Photos are uploaded to Supabase Storage, while the share URL contains only a short surprise ID.

## 1. Create a Supabase project
Open the Supabase Dashboard and create a new project.

## 2. Create the database and photo bucket
Open **SQL Editor** in your project. Open the `supabase.sql` file from this folder, copy everything, paste it into SQL Editor, and click **Run**.

## 3. Add the public Supabase values
Open `js/config.js` and replace:

- `PASTE_YOUR_SUPABASE_PROJECT_URL_HERE` → your Project URL
- `PASTE_YOUR_SUPABASE_PUBLISHABLE_KEY_HERE` → your **Publishable key**

Supabase's current documentation recommends the publishable key for browser code. Never put a Secret key/service_role key in this file.

## 4. Run the website locally
Open the folder in VS Code and run it with Live Server. Then open `create.html`.

## 5. Test
1. Enter the birthday person's name.
2. Set the passcode.
3. Select exactly 4 photos.
4. Click **Create Share Link**.
5. You should get a short URL such as `surprise.html?id=Ab12Cd34Ef`.

## 6. Important before sharing
A localhost URL works only on your computer. For another person to open the surprise, deploy this folder to a public static host. Then the generated URL will use your deployed domain.

## Flow
Create → upload 4 photos → short share link → recipient opens → passcode → birthday reveal → cinematic photo reveal → final message.
