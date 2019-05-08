

require("common")



function checkByCfg()
    print("begin checking..")
    doCheck() -- define at common.lua
end



function main()
    local startTime = os.clock()

    checkByCfg()

    local endTime = os.clock()
    print("lua ok, use time "..(endTime - startTime))
end


main()

---------------
-- 暴露给策划的接口比较少，需要让策划去配置，那一列在那个表的另外一列中必须有这样的配置。
-- 数据的格式要求，逗号分隔的数组之类的。
-- 也就是给策划用的方式越简单越好。