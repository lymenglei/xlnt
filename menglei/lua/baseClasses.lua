-- base classes


require("functions")

SheetInfo = class("SheetInfo")

function SheetInfo:create(t)
    self._excelName = t[1]
    self._sheet = t[2]
    self._col = t[3] + 1 -- 做一个偏移，为了起始都从0开始
    self._startRow = t[4] 
    self._endRow = t[5] and t[5] + 1  -- 做一个偏移，为了起始都从0开始

    if CUR_LANGUAGE == LANGUAGE_EN then
        assert(#t >= 3, "args error, at least 3 expect, got "..#t)
        assert(t[1], "excelName got nil")
        assert(t[2], "sheet got nil")
        assert(t[3], "col got nil")
        if t[5] then
            if t[4] then
                assert(t[5] > t[4], "startRow must be smaller than endRow")
            else
                self._endRow = nil
            end
        end
    elseif CUR_LANGUAGE == LANGUAGE_ZHCN then
        assert(#t >= 3, "配置参数错误，期望3个参数，实际得到"..#t)
        assert(t[1], "excel名字配置为空")
        assert(t[2], "页签配置为空")
        assert(t[3], "列配置未空")
        if t[5] then
            if t[4] then
                assert(t[5] > t[4], "终止行配置一定要小于起始行配置")
            else
                print("警告，第四个参数(起始行)为空时，忽略第五个参数(终止行)的配置")
                self._endRow = nil
            end
        end

    end
end