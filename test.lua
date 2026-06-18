local json = require('json') -- If not available, we just test basic structure

local options = {}
for i = -1, 5 do
    table.insert(options, {
        label = 'Test',
        img = 'img/icons/respray.png',
        price = 0,
        priceMult = 0.0
    })
end

print('Length:', #options)
for k,v in pairs(options) do
    print(k, v.label)
end
