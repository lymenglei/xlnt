-- base classes


require("functions")

SheetInfo = class("SheetInfo")

function SheetInfo:create(t)
    self._excelName = t[1]
    self._sheet = t[2]
    self._col = t[3] + 1 -- ��һ��ƫ�ƣ�Ϊ����ʼ����0��ʼ
    self._startRow = t[4] 
    self._endRow = t[5] and t[5] + 1  -- ��һ��ƫ�ƣ�Ϊ����ʼ����0��ʼ

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
        assert(#t >= 3, "���ò�����������3��������ʵ�ʵõ�"..#t)
        assert(t[1], "excel��������Ϊ��")
        assert(t[2], "ҳǩ����Ϊ��")
        assert(t[3], "������δ��")
        if t[5] then
            if t[4] then
                assert(t[5] > t[4], "��ֹ������һ��ҪС����ʼ������")
            else
                print("���棬���ĸ�����(��ʼ��)Ϊ��ʱ�����Ե��������(��ֹ��)������")
                self._endRow = nil
            end
        end

    end
end