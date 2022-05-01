local function get_week()
    if (os.date("%w") == "0") then
        weekstr = "日"
    end
    if (os.date("%w") == "1") then
        weekstr = "一"
    end
    if (os.date("%w") == "2") then
        weekstr = "二"
    end
    if (os.date("%w") == "3") then
        weekstr = "三"
    end
    if (os.date("%w") == "4") then
        weekstr = "四"
    end
    if (os.date("%w") == "5") then
        weekstr = "五"
    end
    if (os.date("%w") == "6") then
        weekstr = "六"
    end
    weekstr = "星期" .. weekstr
    return weekstr
end

local function translator(input, seg, env)
    if (input == "/date") then
      --- Candidate(type, start, end, text, comment)
        yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), " 日期"))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), " 日期"))
    end
    if (input == "/time") then
      --- Candidate(type, start, end, text, comment)
        yield(Candidate("date", seg.start, seg._end, os.date("%H:%M:%S"), " 时间"))
    end
    if (input == "/datetime") then
      --- Candidate(type, start, end, text, comment)
      local week = get_week()
        yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日 %H:%M:%S"), " 日期"))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d %H:%M:%S"), " 日期"))
    end
    if (input == "/week") then
      --- Candidate(type, start, end, text, comment)
        local week = get_week()
        yield(Candidate("week", seg.start, seg._end, week, " 星期"))
    end
end

return translator
