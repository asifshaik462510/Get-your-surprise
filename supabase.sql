-- Run this entire file in Supabase SQL Editor.
create table if not exists public.birthday_surprises (
  id text primary key,
  name text not null,
  message text not null,
  passcode_hash text not null,
  photo1 text not null,
  photo2 text not null,
  photo3 text not null,
  photo4 text not null,
  created_at timestamptz not null default now()
);
alter table public.birthday_surprises enable row level security;
create policy "public can create surprises" on public.birthday_surprises for insert to anon with check (true);
create policy "public can read surprises" on public.birthday_surprises for select to anon using (true);

-- Storage bucket for the four photos.
insert into storage.buckets (id,name,public) values ('birthday-photos','birthday-photos',true) on conflict (id) do nothing;
create policy "public can upload birthday photos" on storage.objects for insert to anon with check (bucket_id='birthday-photos');
create policy "public can read birthday photos" on storage.objects for select to anon using (bucket_id='birthday-photos');
