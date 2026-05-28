-- 縦割り班シフト管理データ（アプリ全体で1行のみ）
create table if not exists kyudo_shift_state (
  id text primary key default 'main',
  data jsonb not null default '{}',
  updated_at timestamptz not null default now()
);

-- 匿名ユーザーからの読み書きを許可
alter table kyudo_shift_state enable row level security;

create policy "allow anon select" on kyudo_shift_state
  for select using (true);

create policy "allow anon insert" on kyudo_shift_state
  for insert with check (true);

create policy "allow anon update" on kyudo_shift_state
  for update using (true);
