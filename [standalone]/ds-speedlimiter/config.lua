Config = {}
-- Set Config.kmh to false if you want to use mph
Config.kmh = false

-- Set Config.maxSpeed to false if you want to use same speed for all vehicles
-- Set the max speed for all vehicles on Config.maxSpeed
Config.useCategories = false
Config.maxSpeed = 150

-- Specify the framework used: "esx" or "qbcore"
Config.framework = "qbcore"

Config.Categories = {
   -- COMPACTS
   {category = 0, maxSpeed = 100},
   -- SEDANS
   {category = 1, maxSpeed = 100},
   -- SUV'S
   {category = 2, maxSpeed = 100},
   -- COUPES
   {category = 3, maxSpeed = 100},
   -- MUSCLE
   {category = 4, maxSpeed = 100},
   -- SPORT CLASSIC
   {category = 5, maxSpeed = 100},
   -- SPORT
   {category = 6, maxSpeed = 100},
   -- SUPER
   {category = 7, maxSpeed = 100},
   -- MOTORCYCLES
   {category = 8, maxSpeed = 100},
   -- OFFROAD
   {category = 9, maxSpeed = 100},
   -- INDUSTRIAL
   {category = 10, maxSpeed = 100},
   -- UTILITY
   {category = 11, maxSpeed = 100},
   -- VANS
   {category = 12, maxSpeed = 100},
   -- BICYCLES
   {category = 13, maxSpeed = 100},
   -- BOATS
   {category = 14, maxSpeed = 100},
-- -----
   {category = 15, maxSpeed = nil},
   {category = 16, maxSpeed = nil},
-- -----

   -- SERVICE
   {category = 17, maxSpeed = 100},
   -- EMERGENCY
   {category = 18, maxSpeed = 100},
   -- MILITARY
   {category = 19, maxSpeed = 100}
}

-- do not change that, if you don't know what you are doing!
Config.kmhValue = 3.6
Config.mphValue = 2.23694
