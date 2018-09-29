
local config = require("config")
require("utils")

local startTime = os.clock()

config.readExcel2()

local endTime = os.clock()


print("lua ok, use time "..(endTime - startTime))



---------------------------------------
-- 调研： 2018.9.29 15：15
-- 对于热江的道具表，使用python读取的时候，花费的时间为2.18秒
-- 而使用lua读取的时候，使用".."拼接所有的字符串，花费了60秒
-- 使用table.concat方法来拼接字符串，花费时间为10秒
-- 而写入文本的时间可以忽略不计

-- 主要的时间都卡在了C++代码哪里了，10秒卡了9秒
