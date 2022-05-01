local function translator(input, seg, env)
    if (input == "/cmd") then
        os.execute("cmd & pause")
      --- Candidate(type, start, end, text, comment)
      -- yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), " 日期"))
      -- os.execute("cmd")
    end
    if (input == "/ipconfig") then
        os.execute("ipconfig & pause")
      --- Candidate(type, start, end, text, comment)
      -- yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), " 日期"))
      -- os.execute("cmd")
    end

end

return translator