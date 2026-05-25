Job = {}
Job.__index = Job

---@return table
function Job:new(name)
    local obj = {
        name = name or "UnknownJob",
        active = false,
        config = {}
    }
    setmetatable(obj, self)
    return obj
end

function Job:init()
    Debug:Info("Initializing job: %s", self.name)
end

function Job:start()
    self.active = true
    Debug:Info("Started job: %s", self.name)
end

function Job:stop()
    self.active = false
    Debug:Info("Stopped job: %s", self.name)
end

function Job:isActive()
    return self.active
end

