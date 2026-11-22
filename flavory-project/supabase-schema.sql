-- Optional Supabase schema for Flavory user data
create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text,
  created_at timestamptz default now()
);
create table if not exists public.user_recipe_data (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  recipe_id text not null,
  kind text not null check (kind in ('favorite','cooked','rating','review')),
  value jsonb default '{}'::jsonb,
  created_at timestamptz default now()
);
alter table public.profiles enable row level security;
alter table public.user_recipe_data enable row level security;
create policy "profile own read" on public.profiles for select using (auth.uid() = id);
create policy "profile own insert" on public.profiles for insert with check (auth.uid() = id);
create policy "profile own update" on public.profiles for update using (auth.uid() = id);
create policy "data own access" on public.user_recipe_data for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
