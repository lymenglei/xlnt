
local t = {}

-- sheet 和 sheet对应读取的函数
t.list = {
	{sheet = 0, funcName = "read"},
}

-- 描述一个sheet下的读表规则
function t.read(testTable)
	local s = "i3k_db_anqi = {\n"
	for i ,e in ipairs(testTable) do
		s = s .. "\t[" ..toString(testTable[i][1])  .. "] = {"
		s = s .. "name = " .. toString(testTable[i][2])
		s = s .. ", icon = "..testTable[i][4]
		s = s .. ", icon = "..testTable[i][5]
		s = s .. ", icon = "..testTable[i][6]
		s = s .. ", icon = "..testTable[i][7]
		s = s .. ", icon = "..testTable[i][8]
		s = s .. ", icon = "..testTable[i][9]
		s = s .. ", icon = "..testTable[i][10]
		s = s .. ", icon = "..toString(testTable[i][12])
		s = s .."},\n"
	end

	s = s .."}"
	writeFile("gen/out.lua", s)
end


return t
