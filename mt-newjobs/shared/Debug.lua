Debug = {}
Debug.Enabled = false -- Set to false to disable all debug prints

function Debug:Log(msg, ...)
    if not self.Enabled then return end
    print("^3[DEBUG] ^7" .. string.format(msg, ...))
end

function Debug:Info(msg, ...)
    print("^2[INFO] ^7" .. string.format(msg, ...))
end

function Debug:Error(msg, ...)
    print("^1[ERROR] ^7" .. string.format(msg, ...))
end

-- Export for external use if needed, though global 'Debug' usually suffices in shared scripts
exports('SetDebugEnabled', function(enabled)
    Debug.Enabled = enabled
end)

