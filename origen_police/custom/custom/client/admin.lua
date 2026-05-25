-- ============================================================
-- ORIGEN POLICE — ADMIN PANEL CLIENT
-- ============================================================

local adminOpen = false

-- ─── Abrir panel ─────────────────────────────────────────────
local function OpenAdminPanel()
    if adminOpen then return end

    FW_TriggerCallback("origen_police:admin:getGrades", function(data)
        if not data then
            ShowNotification(Config.Translations["NoPermission"] or "Sin permisos para el panel admin.")
            return
        end

        adminOpen = true
        SetNuiFocus(true, true)

        SendNUIMessage({
            action = "openAdminPanel",
            data   = {
                jobs  = data.jobs  or {},
                radio = data.radio or {},
            }
        })
    end)
end

exports("openManagement", OpenAdminPanel)

-- ─── Cerrar panel ─────────────────────────────────────────────
RegisterNUICallback("op_admin_close", function(_, cb)
    adminOpen = false
    SetNuiFocus(false, false)
    cb("ok")

    if GetResourceState("origen_hub") == "started" then
        exports.origen_hub:ReturnToHub("origen_police")
    end
end)

-- ─── Rangos ───────────────────────────────────────────────────
RegisterNUICallback("op_admin_addGrade", function(data, cb)
    TriggerServerEvent("origen_police:admin:addGrade", data)
    cb("ok")
end)

RegisterNUICallback("op_admin_updateGrade", function(data, cb)
    TriggerServerEvent("origen_police:admin:updateGrade", data)
    cb("ok")
end)

RegisterNUICallback("op_admin_removeGrade", function(data, cb)
    TriggerServerEvent("origen_police:admin:removeGrade", data)
    cb("ok")
end)

-- ─── Categorías de departamento ───────────────────────────────
RegisterNUICallback("op_admin_addCategory", function(data, cb)
    TriggerServerEvent("origen_police:admin:addCategory", data)
    cb("ok")
end)

RegisterNUICallback("op_admin_removeCategory", function(data, cb)
    TriggerServerEvent("origen_police:admin:removeCategory", data)
    cb("ok")
end)

-- ─── Radio: categorías ────────────────────────────────────────
RegisterNUICallback("op_admin_addRadioCategory", function(data, cb)
    TriggerServerEvent("origen_police:admin:addRadioCategory", data)
    cb("ok")
end)

RegisterNUICallback("op_admin_removeRadioCategory", function(data, cb)
    TriggerServerEvent("origen_police:admin:removeRadioCategory", data)
    cb("ok")
end)

-- ─── Radio: canales ───────────────────────────────────────────
RegisterNUICallback("op_admin_addRadioChannel", function(data, cb)
    TriggerServerEvent("origen_police:admin:addRadioChannel", data)
    cb("ok")
end)

RegisterNUICallback("op_admin_removeRadioChannel", function(data, cb)
    TriggerServerEvent("origen_police:admin:removeRadioChannel", data)
    cb("ok")
end)

-- ─── Radio: reordenar ─────────────────────────────────────────
RegisterNUICallback("op_admin_reorderRadioCats", function(data, cb)
    TriggerServerEvent("origen_police:admin:reorderRadioCategories", data)
    cb("ok")
end)

RegisterNUICallback("op_admin_reorderRadioChannels", function(data, cb)
    TriggerServerEvent("origen_police:admin:reorderRadioChannels", data)
    cb("ok")
end)

-- ─── Sync: rangos ─────────────────────────────────────────────
RegisterNetEvent("origen_police:admin:gradesUpdated")
AddEventHandler("origen_police:admin:gradesUpdated", function(jobName, grades)
    if not adminOpen then return end
    SendNUIMessage({ action = "adminGradesUpdated", job = jobName, grades = grades })
end)

RegisterNetEvent("origen_police:admin:jobAdded")
AddEventHandler("origen_police:admin:jobAdded", function(job)
    if not adminOpen then return end
    SendNUIMessage({ action = "adminJobAdded", job = job })
end)

RegisterNetEvent("origen_police:admin:jobRemoved")
AddEventHandler("origen_police:admin:jobRemoved", function(jobName)
    if not adminOpen then return end
    SendNUIMessage({ action = "adminJobRemoved", jobName = jobName })
end)

-- ─── Sync: radio (recibido por TODOS los clientes) ────────────
-- Actualiza Config.MultifrecOrdered y Config.Multifrec localmente.
-- Si el panel admin está abierto, también actualiza la UI.
RegisterNetEvent("origen_police:admin:radioUpdated")
AddEventHandler("origen_police:admin:radioUpdated", function(radioData)
    -- Comentado para evitar que borre las frecuencias de config/radio.lua al no haber base de datos
    -- Config.MultifrecOrdered = radioData or {}
    -- Config.Multifrec = {}
    -- for _, v in ipairs(Config.MultifrecOrdered) do
    --     Config.Multifrec[v.category] = v.freqs
    -- end

    -- Si el panel admin está abierto, refrescar la pestaña Radio
    if adminOpen then
        SendNUIMessage({ action = "adminRadioUpdated", radio = Config.MultifrecOrdered })
    end
end)
