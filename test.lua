local currentDate = "2026-06-28"
local lastDate = "2026-06-27"
local streak = 1

local y, m, d = currentDate:match("(%d+)-(%d+)-(%d+)")
local todayTime = os.time({year=y, month=m, day=d, hour=12})

local isYesterday = false
local ly, lm, ld = lastDate:match("(%d+)-(%d+)-(%d+)")
local lastTime = os.time({year=ly, month=lm, day=ld, hour=12})

print("todayTime:", todayTime)
print("lastTime:", lastTime)
print("Diff:", todayTime - lastTime)

if (todayTime - lastTime <= 86400 * 1.5) and (todayTime - lastTime >= 86400 * 0.5) then
    isYesterday = true
end

print("isYesterday:", isYesterday)
