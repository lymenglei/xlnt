

function fileExists(path)
	local file = io.open(path, "rb")
  	if file then
  		file:close()
  	end
  	return file ~= nil
end


function writeFile(fileName, context)
    local file = io.open(fileName, "w+")
	io.output(file)
	io.write(context)
	assert(file ~= nil, "\n\noutput file is a nil value : "..fileName.."\n")
	io.close(file)
end

-- 还是在这里封装一层好
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
