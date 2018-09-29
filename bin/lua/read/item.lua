
local t = {}

-- sheet 和 sheet对应读取的函数
t.list = {
	--{sheet = 0, funcName = "read"},
	{sheet = 0, funcName = "read2"},
}


-- 描述一个sheet下的读表规则
-- 这种方法读取道具表，用时60.119s
function t.read(testTable)
	local s = "i3k_db_item = {\n"
	for i, e in ipairs(testTable) do
		if i > 1 then
			local offset = 1
			s = s .. "\t[" .. (testTable[i][offset + 0]) .. "] = {"
			s = s .. "name = " .. toString(testTable[i][offset + 1])
			s = s .. ", desc = "..toString(testTable[i][offset + 2])
			s = s .. ", icon = "..testTable[i][offset + 3]
			s = s .. ", icon = "..testTable[i][offset + 6]
			s = s .. ", icon = "..testTable[i][offset + 7]
			s = s .. ", icon = "..testTable[i][offset + 8]
			s = s .. ", icon = "..testTable[i][offset + 9]
			s = s .. ", icon = "..testTable[i][offset + 10]
			s = s .. ", icon = "..testTable[i][offset + 11]
			s = s .. ", icon = "..testTable[i][offset + 12]
			s = s .. ", icon = "..testTable[i][offset + 13]
			s = s .. ", icon = "..testTable[i][offset + 14]
			s = s .. ", icon = "..testTable[i][offset + 15]
			s = s .. ", icon = "..testTable[i][offset + 16]
			s = s .. ", icon = "..testTable[i][offset + 17]
			s = s .. ", icon = "..testTable[i][offset + 18]
			s = s .. ", desc = "..toString(testTable[i][offset + 19])
			s = s .. ", icon = "..testTable[i][offset + 20]
			s = s .. ", icon = "..testTable[i][offset + 21]
			s = s .. ", icon = "..testTable[i][offset + 22]
			s = s .. ", icon = "..testTable[i][offset + 23]
			s = s .. ", icon = "..testTable[i][offset + 24]
			s = s .. ", icon = "..testTable[i][offset + 25]
			s = s .. ", icon = "..testTable[i][offset + 26]
			s = s .. ", icon = "..testTable[i][offset + 27]
			s = s .. ", icon = "..testTable[i][offset + 28]
			s = s .. ", icon = "..testTable[i][offset + 29]
			s = s .. ", icon = "..testTable[i][offset + 30]
			s = s .. ", icon = "..testTable[i][offset + 31]
			s = s .. ", icon = "..testTable[i][offset + 32]
			s = s .. ", icon = "..testTable[i][offset + 33]
			s = s .. ", icon = "..testTable[i][offset + 34]
			s = s .. ", icon = "..testTable[i][offset + 35]
			s = s .. ", icon = "..testTable[i][offset + 36]
			s = s .. ", icon = "..testTable[i][offset + 37]
			s = s .. ", icon = "..testTable[i][offset + 38]
			s = s .. ", icon = "..testTable[i][offset + 39]
			s = s .. ", icon = "..testTable[i][offset + 40]
			s = s .. ", icon = "..testTable[i][offset + 41]
			s = s .. ", icon = "..testTable[i][offset + 42]
			s = s .. ", icon = "..testTable[i][offset + 43]
			s = s .. ", icon = "..testTable[i][offset + 44]
			s = s .."},\n"
		end
	end
	s = s .."}"
	writeFile("gen/item.lua", s)
end


-- 描述一个sheet下的读表规则
-- 这种方法读取道具表，用时10.119s
function t.read2(testTable)
	local s = { "i3k_db_item2 = {\n" }
	for i, e in ipairs(testTable) do
		if i > 1 then
			local tbl = {}
			local offset = 1
			table.insert(tbl, "\t[" .. (testTable[i][offset + 0]) .. "] = {")
			table.insert(tbl,  "name = " .. toString(testTable[i][offset + 1]) )
			table.insert(tbl,  ", desc = "..toString(testTable[i][offset + 2]) )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 3] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 6] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 7] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 8] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 9] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 10] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 11] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 12] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 13] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 14] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 15] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 16] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 17] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 18] )
			table.insert(tbl,  ", desc = "..toString(testTable[i][offset + 19])  )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 20] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 21] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 22] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 23] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 24] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 25] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 26] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 27] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 28] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 29] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 30] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 31] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 32] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 33] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 34] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 35] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 36] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 37] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 38] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 39] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 40] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 41] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 42] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 43] )
			table.insert(tbl,  ", icon = "..testTable[i][offset + 44] )
			table.insert(tbl, "},\n" )

			table.insert(s, table.concat(tbl))
		end
	end

	table.insert(s, "}" )
	writeFile("gen/item2.lua", table.concat(s))
end

return t
