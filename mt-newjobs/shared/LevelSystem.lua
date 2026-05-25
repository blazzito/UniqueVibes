-- ===========================
-- SISTEMA DE NIVELES PARA TRABAJOS
-- ===========================

LevelSystem = {}

-- Configuración de niveles (15 niveles totales)
LevelSystem.Config = {
    MaxLevel = 15,
    BonusPercentPerLevel = 3, -- +3% por nivel después del 1
    
    -- XP requerida para cada nivel
    LevelRequirements = {
        [1] = 0,      -- Nivel inicial
        [2] = 150,
        [3] = 300,
        [4] = 500,
        [5] = 750,
        [6] = 1050,
        [7] = 1400,
        [8] = 1800,
        [9] = 2300,
        [10] = 2900,
        [11] = 3600,
        [12] = 4400,
        [13] = 5300,
        [14] = 6300,
        [15] = 7500
    },
    
    -- XP ganada por acción en cada trabajo
    XPPerAction = {
        garbage = 5,     -- Por bolsa recogida
        bus = 5,           -- Por pasajero transportado
        trucker = 5,      -- Por ruta completada
        chicken = 5,      -- Por pollo procesado
        taxi = 5          -- Por carrera completada
    }
}

-- Obtener XP necesaria para un nivel específico
function LevelSystem:GetXPForLevel(level)
    if level < 1 then level = 1 end
    if level > self.Config.MaxLevel then level = self.Config.MaxLevel end
    return self.Config.LevelRequirements[level] or 0
end

-- Obtener bonificación de pago por nivel (en porcentaje)
function LevelSystem:GetPayBonus(level)
    if level <= 1 then return 0 end
    if level > self.Config.MaxLevel then level = self.Config.MaxLevel end
    return (level - 1) * self.Config.BonusPercentPerLevel
end

-- Calcular pago con bonificación de nivel
function LevelSystem:CalculatePay(baseAmount, level)
    local bonusPercent = self:GetPayBonus(level)
    local finalAmount = baseAmount * (1 + (bonusPercent / 100))
    return math.floor(finalAmount)
end

-- Calcular nivel basado en XP total
function LevelSystem:GetLevelFromXP(currentXP)
    local level = 1
    
    for i = self.Config.MaxLevel, 1, -1 do
        if currentXP >= self.Config.LevelRequirements[i] then
            level = i
            break
        end
    end
    
    return level
end

-- Obtener XP actual dentro del nivel (para la barra de progreso)
function LevelSystem:GetCurrentLevelProgress(currentXP)
    local level = self:GetLevelFromXP(currentXP)
    
    if level >= self.Config.MaxLevel then
        return {
            level = level,
            currentXP = 0,
            nextLevelXP = 0,
            percentage = 100,
            isMaxLevel = true
        }
    end
    
    local currentLevelXP = self:GetXPForLevel(level)
    local nextLevelXP = self:GetXPForLevel(level + 1)
    local xpInLevel = currentXP - currentLevelXP
    local xpNeeded = nextLevelXP - currentLevelXP
    local percentage = math.floor((xpInLevel / xpNeeded) * 100)
    
    return {
        level = level,
        currentXP = xpInLevel,
        nextLevelXP = xpNeeded,
        percentage = percentage,
        isMaxLevel = false
    }
end

-- Verificar si el jugador subió de nivel después de ganar XP
function LevelSystem:CheckLevelUp(oldXP, newXP)
    local oldLevel = self:GetLevelFromXP(oldXP)
    local newLevel = self:GetLevelFromXP(newXP)
    
    if newLevel > oldLevel then
        return {
            leveledUp = true,
            oldLevel = oldLevel,
            newLevel = newLevel,
            bonusPercent = self:GetPayBonus(newLevel)
        }
    end
    
    return {
        leveledUp = false,
        oldLevel = oldLevel,
        newLevel = oldLevel,
        bonusPercent = self:GetPayBonus(oldLevel)
    }
end

-- Obtener XP por acción de un trabajo específico
function LevelSystem:GetXPPerAction(jobType)
    return self.Config.XPPerAction[jobType] or 10
end

-- Formatear tiempo para mostrar nivel máximo
function LevelSystem:FormatLevel(level)
    if level >= self.Config.MaxLevel then
        return "Nivel MAX ⭐"
    end
    return "Nivel " .. level
end

