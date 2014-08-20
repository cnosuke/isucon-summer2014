create index idx_is_private on memos (is_private);
create unique index idx_is_private_created_at_id on memos (is_private, created_at, id);
create unique index idx_user_created_at on memos (user, created_at);

ALTER TABLE memos ADD content_html TEXT;
