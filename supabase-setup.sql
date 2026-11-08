-- Run once in Supabase: SQL Editor → New query → paste → Run.
create table if not exists public.fridge_state (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.fridge_state enable row level security;

-- No login: anyone with the page can read and update the inventory.
drop policy if exists "public read"   on public.fridge_state;
drop policy if exists "public insert" on public.fridge_state;
drop policy if exists "public update" on public.fridge_state;
create policy "public read"   on public.fridge_state for select to anon using (true);
create policy "public insert" on public.fridge_state for insert to anon with check (true);
create policy "public update" on public.fridge_state for update to anon using (true) with check (true);

-- Live updates between devices
do $$ begin
  alter publication supabase_realtime add table public.fridge_state;
exception when duplicate_object then null; end $$;
