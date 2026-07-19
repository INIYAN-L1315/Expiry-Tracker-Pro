const { Pool } = require('pg');
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'expiry_tracker_db1',
  password: 'iniyan13032006', // Put your actual Postgres password here
  port: 5432,
});
module.exports = pool;