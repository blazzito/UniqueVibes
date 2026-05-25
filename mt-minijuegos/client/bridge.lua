AddEventHandler('mt-minijuegos:startGame', function(gameName, difficulty)

    local minigames = {
        lockpick     = StartLockpick,
        hacking      = StartHacking,
        codebreaker  = StartCodeBreaker,
        wirepuzzle   = StartWirePuzzle,
        minesweeper  = StartMinesweeper,
        timingcircles = StartTimingCircles,
        varhack      = StartVarHack,
        powergrid    = StartPowerGrid,
    }
    local fn = minigames[gameName]
    if fn then
        fn(difficulty, function(success)

            TriggerEvent('mt-minijuegos:gameResult', success)
            TriggerServerEvent('mt-minijuegos:server:gameResult', gameName, success)
        end)
    else

        TriggerEvent('mt-minijuegos:gameResult', false)
    end
end)

