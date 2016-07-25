assert = require 'assert'

module.exports = (ColdDB) ->
  myDB = new ColdDB

  assert myDB.create
