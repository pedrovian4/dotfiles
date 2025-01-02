local utils = require("tests.utils")
local surrounder = require("commands.surrounder")

local surrounder_abacaxi = surrounder.surrounder('""', "abacaxi")

utils.assert_equal(surrounder_abacaxi, '"abacaxi"', "Should return abacaxi under double quotes")
