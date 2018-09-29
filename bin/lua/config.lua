config = {}

config.conf =
{
	{excel = "excels/example.xlsx", file = require("read/doImpl")},
}




function config.readExcel()
	for k, v in ipairs(config.conf) do
		local excel = v.excel
		assert(fileExists(excel), "\nfile "..excel.." not found!")
		local func = v.file.read
		local sheet = 3
		local testTable = ReadExcel(sheet, excel) -- read a excel
		func(testTable)
	end
end

function config.readExcel2()
	for k, v in ipairs(config.conf) do
		local excel = v.excel
		assert(fileExists(excel), "\nfile "..excel.." not found!")
		local list = v.file.list
		for i, e in ipairs(list) do
			local sheet = e.sheet
			local funcName = e.funcName
			local func = v.file[funcName]
			local testTable = ReadExcel(sheet, excel) -- read a excel
			func(testTable)
		end

	end
end


return config
