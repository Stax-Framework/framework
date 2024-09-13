const config = {
    connectionLimit: 10,
    host: GetConvar("exsql_db_host", "localhost"),
    user: GetConvar("exsql_db_user", "root"),
    password: GetConvar("exsql_db_password", ""),
    database: GetConvar("exsql_db_database", "personal"),
    dev: GetConvar("exsql_devmode", "false")
};

module.exports = config;