-- Run this SQL in Supabase SQL Editor.
create table if not exists public.products (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  category text not null default 'Other',
  price numeric(10,2) not null default 0,
  description text default '',
  image_url text not null,
  storage_path text not null,
  published boolean not null default true,
  created_at timestamptz not null default now()
);
alter table public.products enable row level security;

drop policy if exists "Public can view published products" on public.products;
create policy "Public can view published products" on public.products
for select using (published = true or (auth.jwt() ->> 'email') = 'maisuriadarshan2@gmail.com');

drop policy if exists "Admin can insert products" on public.products;
create policy "Admin can insert products" on public.products
for insert with check ((auth.jwt() ->> 'email') = 'maisuriadarshan2@gmail.com');

drop policy if exists "Admin can update products" on public.products;
create policy "Admin can update products" on public.products
for update using ((auth.jwt() ->> 'email') = 'maisuriadarshan2@gmail.com')
with check ((auth.jwt() ->> 'email') = 'maisuriadarshan2@gmail.com');

drop policy if exists "Admin can delete products" on public.products;
create policy "Admin can delete products" on public.products
for delete using ((auth.jwt() ->> 'email') = 'maisuriadarshan2@gmail.com');

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('previews','previews',true,10485760,array['image/jpeg','image/png','image/webp'])
on conflict (id) do nothing;

drop policy if exists "Public can view previews" on storage.objects;
create policy "Public can view previews" on storage.objects
for select using (bucket_id = 'previews');

drop policy if exists "Admin can upload previews" on storage.objects;
create policy "Admin can upload previews" on storage.objects
for insert with check (bucket_id = 'previews' and (auth.jwt() ->> 'email') = 'maisuriadarshan2@gmail.com');

drop policy if exists "Admin can delete previews" on storage.objects;
create policy "Admin can delete previews" on storage.objects
for delete using (bucket_id = 'previews' and (auth.jwt() ->> 'email') = 'maisuriadarshan2@gmail.com');
