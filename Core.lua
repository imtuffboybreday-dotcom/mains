return function(Config)
    if type(Config) ~= "table" then
        return
    end

    if Config.Enabled ~= true then
        return
    end

    if Config.Version ~= "3.0.0" then
        return
    end

    if type(Config.Integrity) ~= "table" then
        return
    end

    local Integrity = Config.Integrity

    if Integrity.StageOne ~= "A7F29C" then
        return
    end

    if Integrity.StageTwo ~= "D41B8E" then
        return
    end

    if Integrity.StageThree ~= "93C6FA" then
        return
    end

    if Integrity.RuntimeId ~= "5E17D2" then
        return
    end

    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local Player = Players.LocalPlayer

    if not Player then
        return
    end

    local verified = true
    local elapsed = 0

    local connection
    connection = RunService.Heartbeat:Connect(function(delta)
        if not verified then
            if connection then
                connection:Disconnect()
            end
            return
        end

        elapsed += delta

        if elapsed < Config.CheckInterval then
            return
        end

        elapsed = 0

        if Config.Version ~= "3.0.0" then
            verified = false
            if connection then
                connection:Disconnect()
            end
            return
        end

        if type(Config.Integrity) ~= "table" then
            verified = false
            if connection then
                connection:Disconnect()
            end
            return
        end

        local current = Config.Integrity

        if current.StageOne ~= "A7F29C"
            or current.StageTwo ~= "D41B8E"
            or current.StageThree ~= "93C6FA"
            or current.RuntimeId ~= "5E17D2" then

            verified = false

            if connection then
                connection:Disconnect()
            end

            return
        end
    end)

    return true
end