function toNumber(value)
	if not value then return 0 end
	return value
end

function toFloat(value)
	if not value then return "0.0" end
	return value
end


function toString(value)
	if not value then return "\"\"" end
	return "\""..value.."\""
end

function splitString(src, sep)
	local sep, fields = sep or ";", {}  
    local pattern = string.format("([^%s]+)", sep)  
    string.gsub(src, pattern, function(c) fields[#fields+1] = c end)  
    return fields  
end

----------------file io-------------
function fileExists(path)
	local file = io.open(path, "rb")
  	if file then
  		file:close()
    end
    print(path)
  	return file ~= nil
end


function writeFile(fileName, context)
    local file = io.open(fileName, "w+")
	io.output(file)
	io.write(context)
	assert(file ~= nil, "\n\noutput file is a nil value : "..fileName.."\n")
	io.close(file)
end

------------------------------------
-- 返回一个二维数组
function excel2table(sheet, excel)
    if not fileExists(excel) then
        error("文件 "..excel.." 不存在")
    end

    local t = ReadExcel(sheet, excel) -- C++ function
    return t
end

function checkExcelArray(str)
    local i = string.find(str, ";")
    if i then return ";" end

    local j = string.find(str, "；")
    if j then return "；" end
end

function splitExcelArray(str, sep)
    local fields = splitString(str, sep)
    return fields
end

-- return a table
function getCell(source)
    local f = checkExcelArray(source)
    if f then 
        return splitExcelArray(source, f)
    else
        return {[1] = source}
    end
end