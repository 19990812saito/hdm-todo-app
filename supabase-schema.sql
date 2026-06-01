create table if not exists public.app_state (
  id text primary key,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

insert into public.app_state (id, data)
values ('main', '{}'::jsonb)
on conflict (id) do nothing;

-- MVP運用用です。GitHub Pagesの静的アプリから読み書きするため、
-- RLSは後でログインを入れるタイミングで有効化します。
alter table public.app_state disable row level security;
