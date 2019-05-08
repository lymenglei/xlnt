-- common interface

require("utils")
require("baseClasses")
require("checkCfg")

function checkSheet(srcExcel, sheetID1, col, startRow, endRow, targetExcel, sheetID2, col2, startRow2, endRow2)
    local Name1 = EXCEL_DIR.."/"..srcExcel..SUFFIX
    local Name2 = EXCEL_DIR.."/"..targetExcel..SUFFIX
    local tbl1 = excel2table(sheetID1, Name1)
    local tbl2 = excel2table(sheetID2, Name2)

    local row1 = startRow or 0
    local size1 = endRow and (endRow - startRow) or #tbl1 
    size1 = size1 > #tbl1 and #tbl1 or size1 -- avoid endRow overflow

    local row2 = startRow2 or 0
    local size2 = endRow2 and (endRow2 - startRow2) or #tbl2 
    size2 = size2 > #tbl2 and #tbl2 or size2 -- avoid endRow2 overflow

    local targetTable = {}
    for j = row2, size2 do
        local val = tbl2[j][col2]
        targetTable[tostring(val)] = true
    end

    -- print(tbl1["sheetName"]) -- 中文乱码

    for i = row1, size1 do
        local row = tbl1[i]
        local key = row[col]
        local flag = false
        -- if targetTable[tostring(key)] then
        --     flag = true
        -- end

        for k, v in ipairs(getCell(key)) do
            if targetTable[tostring(v)] then
                flag = true
            else
                print("==> key = "..v.." 未找到")
                flag = false
                break
            end
        end 

        -- print("key = "..key)

        if CUR_LANGUAGE == LANGUAGE_EN then
            assert(flag, "\n\nkey:"..key.." in file:\n"..srcExcel.." sheet:"..sheetID1.." col:"..col..
                ", not found in file:\n"..targetExcel.." sheet:"..sheetID2.." col:"..col2)
        elseif CUR_LANGUAGE == LANGUAGE_ZHCN then
            local str = "\n\n%s%s，第%d个页签中【第%d列 第%d行】值为\'%s\'在\n%s%s，第%d个页签中的第%d列，没有找到对应的配置！"
            assert(flag, string.format(str, srcExcel, SUFFIX, sheetID1, col-1, i, key, targetExcel, SUFFIX, sheetID2, col2-1))
        end
    end
end

function checkSheetByObj(obj1, obj2)
    assert(obj1:getName() == obj2:getName(), "class type error, not equal")
    checkSheet(obj1._excelName, obj1._sheet, obj1._col , obj1._startRow, obj1._endRow ,  
                obj2._excelName, obj2._sheet, obj2._col , obj2._startRow, obj2._endRow )
end


-- 暴露出的接口
function doCheck()
    for k, v in ipairs(check_cfg) do
        local obj1 = SheetInfo:new()
        obj1:create(v.src)
        local obj2 = SheetInfo:new()
        obj2:create(v.target)

        checkSheetByObj(obj1, obj2)
    end

end