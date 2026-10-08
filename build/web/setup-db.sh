#!/bin/sh
# Imports upstream's SQL/webgoat.sql into the db machine once the database answers, so the lab
# starts ready. Skipped when the jf_users table already exists, so a restart keeps the database
# as the player left it.
php -r '
for ($i = 0; $i < 150; $i++) {
  $c = @new mysqli("db", "webgoat", "webgoat", "webgoat");
  if (!$c->connect_errno) {
    if ($c->query("SELECT 1 FROM jf_users LIMIT 1")) { echo "webgoat-setup-db: database ready\n"; exit(0); }
    if ($c->multi_query(file_get_contents("/var/www/html/SQL/webgoat.sql"))) {
      while ($c->more_results() && $c->next_result()) {}
    }
    if ($c->errno) echo "webgoat-setup-db: ", $c->error, "\n";
  }
  sleep(2);
}
echo "webgoat-setup-db: database setup failed\n"; exit(1);
'
