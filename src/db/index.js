var sworm = require('sworm');

var db = sworm.db({
  driver: 'pg',
  config: {
    host: 'localhost',
    database: 'touvoly',
    user: 'postgres',
    password: 'admin',
  }
});


module.exports = db