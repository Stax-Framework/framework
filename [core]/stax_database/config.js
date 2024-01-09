module.exports = {
  host: GetConvar("stax_db_host", "localhost"),
  port: GetConvar("stax_db_port", "27017"),
  db: GetConvar("stax_db_database", "stax"),
  dev: GetConvar("stax_db_devmode", "false"),
  warn: GetConvar("stax_db_warn", "750"),
  pool: {
    min: GetConvar("stax_db_pool_min", "5"),
    max: GetConvar("stax_db_pool_max", "20")
  }
}