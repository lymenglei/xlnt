
-- 把此文件的编码改为gbk
EXCEL_DIR = "excels"  -- excel目录配置
SUFFIX = ".xlsx"

LANGUAGE_ZHCN = "ZH_CN"
LANGUAGE_EN = "EN"

CUR_LANGUAGE = LANGUAGE_ZHCN

-- src 和 target 配置格式相同，都有5个参数，用逗号分隔
-- 其中前三个参数是必须的，后面两个参数是可选的
-- 第一个参数是excel表格的名字，不带后缀.xlsx
-- 第二个参数表示的是第几个页签(sheet)，从0开始
-- 第三个参数表示的是列，从0开始
-- 第四个参数可选，表示起始行，默认从第2行(包括该行，index从0开始)
-- 第五个参数可选，表示终止行，默认为表的最后(包括该行,index从0开始)
check_cfg = 
{
    {src = {"test1", 1, 2, 1, 4}, target = {"test1", 0, 0, 1, } },
    
}


