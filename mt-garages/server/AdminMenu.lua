-- Admin Menu System - Server-side Management

-- Global data tables
_G.vehicleslabels = {}
_G.vehicles = {}
_G.gangvehicles = {}
_G.garages = {}
_G.impounds = {}

Citizen.CreateThread(function()
    -- Wait for Framework to initialize
    while Framework == nil do
        Wait(5)
    end
    
    -- ========================================
    -- GARAGE MANAGEMENT
    -- ========================================
    
    -- Create new garage
    Fr.RegisterServerCallback("mt-garages:CreateNewGarage", function(source, callback, data)
        if not isAllowedAdmin(source) then
            return callback({status = false})
        end
        
        local coords = {
            CenterOfZone = data.centerofzone,
            AccessPoint = data.accesspoint
        }
        
        local jobName = data.isJob and data.job.name or nil
        local gangName = data.IsGang and data.Gang.name or nil
        
        MySQL.Async.insert(
            "INSERT INTO `mtgarages_garages` (`Label`, `Type`, `Coords`, `JobName`, `JobGrade`, `JobMode`, `Radius`, `isPrivate`, `privatePlayers`, `zpoints`, `onespawn`, `blipDisabled`, `GangName`, `GangGrade`, `GangMode`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
            {
                data.label,
                data.type.value,
                json.encode(coords),
                jobName,
                data.isJob and data.job.grade or 0,
                data.isJob and data.job.mode or "owned",
                data.radius,
                data.isPrivate,
                json.encode(data.PrivatePlayersList),
                json.encode(data.zPoints),
                json.encode(data.oneSpawn),
                data.blipDisabled,
                gangName,
                data.IsGang and data.Gang.grade or 0,
                data.IsGang and data.Gang.mode or "owned"
            },
            function(insertId)
                callback({status = true, index = insertId})
                
                -- Update server-side garage data
                garages[tostring(insertId)] = {
                    Index = insertId,
                    Label = data.label,
                    Type = data.type.value,
                    CenterOfZone = vec4(
                        tonumber(coords.CenterOfZone.x),
                        tonumber(coords.CenterOfZone.y),
                        tonumber(coords.CenterOfZone.z),
                        tonumber(coords.CenterOfZone.w)
                    ),
                    AccessPoint = vec4(
                        tonumber(coords.AccessPoint.x),
                        tonumber(coords.AccessPoint.y),
                        tonumber(coords.AccessPoint.z),
                        tonumber(coords.AccessPoint.w)
                    ),
                    Radius = data.radius,
                    IsPrivate = data.isPrivate,
                    PrivatePlayersList = data.PrivatePlayersList,
                    zPoints = data.zPoints,
                    blipDisabled = data.blipDisabled,
                    onespawn = vec4(
                        tonumber(data.oneSpawn.x),
                        tonumber(data.oneSpawn.y),
                        tonumber(data.oneSpawn.z),
                        tonumber(data.oneSpawn.w)
                    )
                }
                
                -- Add job data if applicable
                if data.isJob then
                    garages[tostring(insertId)].Job = {
                        name = data.job.name,
                        grade = data.job.grade,
                        type = data.job.mode
                    }
                end
                
                -- Add gang data if applicable
                if data.IsGang then
                    garages[tostring(insertId)].Gang = {
                        name = data.Gang.name,
                        grade = data.Gang.grade,
                        type = data.Gang.mode
                    }
                end
                
                -- Notify all clients
                TriggerClientEvent("mt-garages:registerNewLocation", -1, garages[tostring(insertId)])
            end
        )
    end)
    
    -- Edit existing garage
    Fr.RegisterServerCallback("mt-garages:editGarageLocation", function(source, callback, data)
        if not isAllowedAdmin(source) then
            return callback({status = false})
        end
        
        local coords = {
            CenterOfZone = data.centerofzone,
            AccessPoint = data.accesspoint
        }
        
        local jobName = data.isJob and data.job.name or nil
        local gangName = data.IsGang and data.Gang.name or nil
        
        MySQL.Async.execute(
            "UPDATE `mtgarages_garages` SET isPrivate = @isPrivate, privatePlayers = @privatePlayers, Label = @Label, Type = @Type, Coords = @Coords, JobName = @JobName, JobGrade = @JobGrade, JobMode = @JobMode, Radius = @Radius, zpoints = @zPoints, onespawn = @oneSpawn, blipDisabled = @blipDisabled, GangName = @GangName, GangGrade = @GangGrade, GangMode = @GangMode WHERE `Index` = @Index",
            {
                ["@isPrivate"] = data.isPrivate,
                ["@privatePlayers"] = json.encode(data.PrivatePlayersList),
                ["@Label"] = data.label,
                ["@Type"] = data.type.value,
                ["@Coords"] = json.encode(coords),
                ["@JobName"] = jobName,
                ["@JobGrade"] = data.isJob and data.job.grade or 0,
                ["@JobMode"] = data.isJob and data.job.mode or "owned",
                ["@Radius"] = data.radius,
                ["@Index"] = data.index,
                ["@zPoints"] = json.encode(data.zPoints),
                ["@oneSpawn"] = json.encode(data.oneSpawn),
                ["@blipDisabled"] = data.blipDisabled,
                ["@GangName"] = gangName,
                ["@GangGrade"] = data.IsGang and data.Gang.grade or 0,
                ["@GangMode"] = data.IsGang and data.Gang.mode or "owned"
            }
        )
        
        callback({status = true})
        
        -- Update server-side garage data
        garages[tostring(data.index)] = {
            Index = data.index,
            Label = data.label,
            Type = data.type.value,
            CenterOfZone = vec4(
                tonumber(coords.CenterOfZone.x),
                tonumber(coords.CenterOfZone.y),
                tonumber(coords.CenterOfZone.z),
                tonumber(coords.CenterOfZone.w)
            ),
            AccessPoint = vec4(
                tonumber(coords.AccessPoint.x),
                tonumber(coords.AccessPoint.y),
                tonumber(coords.AccessPoint.z),
                tonumber(coords.AccessPoint.w)
            ),
            Radius = data.radius,
            IsPrivate = data.isPrivate,
            PrivatePlayersList = data.PrivatePlayersList,
            zPoints = data.zPoints,
            blipDisabled = data.blipDisabled,
            onespawn = vec4(
                tonumber(data.oneSpawn.x),
                tonumber(data.oneSpawn.y),
                tonumber(data.oneSpawn.z),
                tonumber(data.oneSpawn.w)
            )
        }
        
        if data.isJob then
            garages[tostring(data.index)].Job = {
                name = data.job.name,
                grade = data.job.grade,
                type = data.job.mode
            }
        end
        
        if data.IsGang then
            garages[tostring(data.index)].Gang = {
                name = data.Gang.name,
                grade = data.Gang.grade,
                type = data.Gang.mode
            }
        end
        
        TriggerClientEvent("mt-garages:editLocation", -1, garages[tostring(data.index)])
    end)
    
    -- Delete garage
    Fr.RegisterServerCallback("mt-garages:deleteGarage", function(source, callback, data)
        if not isAllowedAdmin(source) then
            return callback({status = false})
        end
        
        MySQL.Async.execute(
            "DELETE FROM `mtgarages_garages` WHERE `Index` = @Index",
            {["@Index"] = data.Index}
        )
        
        callback({status = true})
        garages[tostring(data.Index)] = nil
        TriggerClientEvent("mt-garages:deleteLocation", -1, data.Index)
    end)
    
    -- ========================================
    -- IMPOUND MANAGEMENT
    -- ========================================
    
    -- Create impound
    Fr.RegisterServerCallback("mt-garages:createImpound", function(source, callback, data)
        if not isAllowedAdmin(source) then
            return callback({status = false})
        end
        
        MySQL.Async.insert(
            "INSERT INTO `mtgarages_impounds` (`Label`, `Type`, `Coords`, `AllowedJobs`, `blipDisabled`) VALUES (?, ?, ?, ?, ?)",
            {
                data.Label,
                data.Type,
                json.encode(data.Coords),
                json.encode(data.AllowedJobs),
                data.blipDisabled
            },
            function(insertId)
                callback({status = true, index = insertId})
                
                impounds[tostring(insertId)] = {
                    Index = insertId,
                    Label = data.Label,
                    Type = data.Type,
                    Coords = vec4(
                        tonumber(data.Coords.x),
                        tonumber(data.Coords.y),
                        tonumber(data.Coords.z),
                        tonumber(data.Coords.w)
                    ),
                    AllowedJobs = data.AllowedJobs,
                    blipDisabled = data.blipDisabled
                }
                
                TriggerClientEvent("mt-garages:registerNewLocationImpound", -1, impounds[tostring(insertId)])
            end
        )
    end)
    
    -- Edit impound
    Fr.RegisterServerCallback("mt-garages:editImpound", function(source, callback, data)
        if not isAllowedAdmin(source) then
            return callback({status = false})
        end
        
        MySQL.Async.execute(
            "UPDATE `mtgarages_impounds` SET Label = @Label, Type = @Type, Coords = @Coords, AllowedJobs = @AllowedJobs, blipDisabled = @blipDisabled WHERE `Index` = @Index",
            {
                ["@Label"] = data.Label,
                ["@Type"] = data.Type,
                ["@Coords"] = json.encode(data.Coords),
                ["@AllowedJobs"] = json.encode(data.AllowedJobs),
                ["@Index"] = data.Index,
                ["@blipDisabled"] = data.blipDisabled
            }
        )
        
        callback({status = true})
        
        impounds[tostring(data.Index)] = {
            Index = data.Index,
            Label = data.Label,
            Type = data.Type,
            Coords = vec4(
                tonumber(data.Coords.x),
                tonumber(data.Coords.y),
                tonumber(data.Coords.z),
                tonumber(data.Coords.w)
            ),
            AllowedJobs = data.AllowedJobs,
            blipDisabled = data.blipDisabled
        }
        
        TriggerClientEvent("mt-garages:editLocationImpound", -1, impounds[tostring(data.Index)])
    end)
    
    -- Delete impound
    Fr.RegisterServerCallback("mt-garages:deleteImpound", function(source, callback, data)
        if not isAllowedAdmin(source) then
            return callback({status = false})
        end
        
        MySQL.Async.execute(
            "DELETE FROM `mtgarages_impounds` WHERE `Index` = @Index",
            {["@Index"] = data.Index}
        )
        
        callback({status = true})
        impounds[tostring(data.Index)] = nil
        TriggerClientEvent("mt-garages:deleteLocationImpound", -1, data.Index)
    end)
    
    -- ========================================
    -- VEHICLE LABEL MANAGEMENT
    -- ========================================
    
    -- Create vehicle label
    Fr.RegisterServerCallback("mt-garages:createVehicle", function(source, callback, data)
        if not isAllowedAdmin(source) then
            return callback({status = false})
        end
        
        MySQL.Async.insert(
            "INSERT INTO `mtgarages_vehicles` (`model`, `label`) VALUES (?, ?)",
            {data.model, data.label},
            function(insertId)
                callback({status = true})
                
                local vehicleData = {
                    model = data.model,
                    label = data.label
                }
                
                vehicleslabels[tostring(data.model)] = vehicleData
                TriggerClientEvent("mt-garages:registerVehicleLabel", -1, vehicleslabels[tostring(data.model)])
            end
        )
    end)
    
    -- Edit vehicle label
    Fr.RegisterServerCallback("mt-garages:editVehicle", function(source, callback, data)
        if not isAllowedAdmin(source) then
            return callback({status = false})
        end
        
        MySQL.Async.execute(
            "UPDATE `mtgarages_vehicles` SET model = @model, label = @label WHERE `model` = @oldmodel",
            {
                ["@label"] = data.label,
                ["@model"] = data.model,
                ["@oldmodel"] = data.oldmodel
            }
        )
        
        callback({status = true})
        
        local vehicleData = {
            model = data.model,
            label = data.label
        }
        
        vehicleslabels[tostring(data.oldmodel)] = nil
        vehicleslabels[tostring(data.model)] = vehicleData
        TriggerClientEvent("mt-garages:registerVehicleLabel", -1, vehicleslabels[tostring(data.model)])
    end)
    
    -- Delete vehicle label
    Fr.RegisterServerCallback("mt-garages:deleteVehicle", function(source, callback, data)
        if not isAllowedAdmin(source) then
            return callback({status = false})
        end
        
        MySQL.Async.execute(
            "DELETE FROM `mtgarages_vehicles` WHERE `model` = @model",
            {["@model"] = data.model}
        )
        
        callback({status = true})
        vehicleslabels[tostring(data.model)] = nil
        TriggerClientEvent("mt-garages:deleteVehicleLabel", -1, data.model)
    end)
    
    -- ========================================
    -- JOB VEHICLE MANAGEMENT
    -- ========================================
    
    -- Create job vehicle
    Fr.RegisterServerCallback("mt-garages:createJobVehicle", function(source, callback, data)
        if not isAllowedAdmin(source) then
            return callback({status = false})
        end
        
        MySQL.Async.insert(
            "INSERT INTO `mtgarages_jobvehicles` (`model`, `job`, `gradesAllowed`, `properties`) VALUES (?, ?, ?, ?)",
            {
                data.model,
                data.job,
                json.encode(data.gradesAllowed),
                json.encode(data.properties)
            },
            function(insertId)
                callback({status = true, index = insertId})
                
                local vehicleData = {
                    model = data.model,
                    gradesAllowed = data.gradesAllowed,
                    job = data.job,
                    properties = data.properties,
                    index = insertId
                }
                
                vehicles[tostring(insertId)] = vehicleData
                TriggerClientEvent("mt-garages:createJobVehicle", -1, vehicles[tostring(insertId)])
            end
        )
    end)
    
    -- Edit job vehicle
    Fr.RegisterServerCallback("mt-garages:editJobVehicle", function(source, callback, data)
        if not isAllowedAdmin(source) then
            return callback({status = false})
        end
        
        MySQL.Async.execute(
            "UPDATE `mtgarages_jobvehicles` SET model = @model, job = @job, gradesAllowed = @gradesAllowed, properties = @properties WHERE `index` = @index",
            {
                ["@model"] = data.model,
                ["@job"] = data.job,
                ["@gradesAllowed"] = json.encode(data.gradesAllowed),
                ["@properties"] = json.encode(data.properties),
                ["@index"] = data.index
            }
        )
        
        callback({status = true})
        
        local vehicleData = {
            model = data.model,
            gradesAllowed = data.gradesAllowed,
            job = data.job,
            properties = data.properties,
            index = data.index
        }
        
        vehicles[tostring(data.index)] = vehicleData
        TriggerClientEvent("mt-garages:createJobVehicle", -1, vehicles[tostring(data.index)])
    end)
    
    -- Delete job vehicle
    Fr.RegisterServerCallback("mt-garages:deleteJobVehicle", function(source, callback, data)
        if not isAllowedAdmin(source) then
            return callback({status = false})
        end
        
        MySQL.Async.execute(
            "DELETE FROM `mtgarages_jobvehicles` WHERE `index` = @index",
            {["@index"] = data.index}
        )
        
        callback({status = true})
        vehicles[tostring(data.index)] = nil
        TriggerClientEvent("mt-garages:deleteJobVehicle", -1, data.index)
    end)
    
    -- ========================================
    -- GANG VEHICLE MANAGEMENT
    -- ========================================
    
    -- Create gang vehicle
    Fr.RegisterServerCallback("mt-garages:createGangVehicle", function(source, callback, data)
        if not isAllowedAdmin(source) then
            return callback({status = false})
        end
        
        MySQL.Async.insert(
            "INSERT INTO `mtgarages_gangvehicles` (`model`, `gang`, `gradesAllowed`, `properties`) VALUES (?, ?, ?, ?)",
            {
                data.model,
                data.gang,
                json.encode(data.gradesAllowed),
                json.encode(data.properties)
            },
            function(insertId)
                callback({status = true, index = insertId})
                
                local vehicleData = {
                    model = data.model,
                    gradesAllowed = data.gradesAllowed,
                    gang = data.gang,
                    properties = data.properties,
                    index = insertId
                }
                
                gangvehicles[tostring(insertId)] = vehicleData
                TriggerClientEvent("mt-garages:createGangVehicle", -1, gangvehicles[tostring(insertId)])
            end
        )
    end)
    
    -- Edit gang vehicle
    Fr.RegisterServerCallback("mt-garages:editGangVehicle", function(source, callback, data)
        if not isAllowedAdmin(source) then
            return callback({status = false})
        end
        
        MySQL.Async.execute(
            "UPDATE `mtgarages_gangvehicles` SET model = @model, gang = @gang, gradesAllowed = @gradesAllowed, properties = @properties WHERE `index` = @index",
            {
                ["@model"] = data.model,
                ["@gang"] = data.gang,
                ["@gradesAllowed"] = json.encode(data.gradesAllowed),
                ["@properties"] = json.encode(data.properties),
                ["@index"] = data.index
            }
        )
        
        callback({status = true})
        
        local vehicleData = {
            model = data.model,
            gradesAllowed = data.gradesAllowed,
            gang = data.gang,
            properties = data.properties,
            index = data.index
        }
        
        gangvehicles[tostring(data.index)] = vehicleData
        TriggerClientEvent("mt-garages:createGangVehicle", -1, gangvehicles[tostring(data.index)])
    end)
    
    -- Delete gang vehicle
    Fr.RegisterServerCallback("mt-garages:deleteGangVehicle", function(source, callback, data)
        if not isAllowedAdmin(source) then
            return callback({status = false})
        end
        
        MySQL.Async.execute(
            "DELETE FROM `mtgarages_gangvehicles` WHERE `index` = @index",
            {["@index"] = data.index}
        )
        
        callback({status = true})
        gangvehicles[tostring(data.index)] = nil
        TriggerClientEvent("mt-garages:deleteGangVehicle", -1, data.index)
    end)
end)