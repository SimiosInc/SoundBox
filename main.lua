local _, S = ...

local addonPrefix = "SoundBox"
local folderName = "Interface\\AddOns\\SoundBox\\sound\\"
local playerName = UnitName("player")
local soundHandle
local soundFileID = 0
local playList = {}
local sounds = S
local setWho = true
local setDND = false
local setDebug = false
local version

--   Create listener Frame

local f = CreateFrame("Frame")
f:RegisterEvent("CHAT_MSG_ADDON")
f:SetScript(
    "OnEvent",
    function(self, event, prefix, message, channel, sender)
        if event == "CHAT_MSG_ADDON" and prefix == addonPrefix then
            local fileName = sounds[message]
            if not fileName then
                return
            end

            if not setDND then
                local soundPath = folderName .. fileName .. ".ogg"
                local ok, _, handle = pcall(PlaySoundFile, soundPath, "Master")

                if ok then
                    soundHandle = handle
                    soundFileID = soundFileID + 1
                    playList[soundFileID] = handle
                end

                if setWho == true and ok == true then
                    local name = Ambiguate(sender, "short")
                    print("|cff00FF96SoundBox|r: |cFFFF8040" .. name .. "|r |cFFFF8040played " .. message .. "|r")
                end
                --@debug@
                if setDebug then
                    print(
                        "|cff00FF96Prefix|r: " .. addonPrefix .. "\n",
                        "|cff00FF96Folder|r: " .. folderName .. "\n",
                        "|cff00FF96File|r: " .. fileName .. "\n",
                        "|cff00FF96By|r: " .. sender .. "\n",
                        "|cff00FF96In|r: " .. channel .. "\n",
                        "|cff00FF96Handle|r: " .. handle .. "\n"
                    )
                end
            --@end-debug@
            end
        end
    end
)

-- Create Sender Slash Command

SLASH_SB1 = "/sb"
SlashCmdList.SB = function(message)
    if message == "stop" then
        for _, handle in pairs(playList) do
            StopSound(handle)
            playList = {}
            --@debug@
            if setDebug then
                print("|cff00FF96Stopped|r: " .. soundHandle)
            end
            --@end-debug@
        end
    end

    if message == "version" then
        version = GetAddOnMetadata("SoundBox", "version")
        print("|cff00FF96SoundBox|r: |cFFFF8040Version: |r" .. version)
    end

    if message == "sounds" then
        local s = ""
        sounds.sounds = "cmd"
        for k, _ in pairs(sounds) do
            s = s .. k .. ", "
        end
        print("|cff00FF96SoundBox|r\124|Sounds: /sb |r" .. s )
    end

    if message == "help" then
        print("|cff00FF96SoundBox|r\124|Help: |cFFFF8040/sb version, dnd, who, stop  " .. s .. "|r")
    end


    if message == "dnd" then
        if setDND then
            setDND = false
            print("|cff00FF96SoundBox|r\124|Set:|cFFFF8040 Do Not Disturb OFF|r")
        else
            setDND = true
            print("|cff00FF96SoundBox|r\124|Set:|cFFFF8040 Do Not Disturb ON|r")
        end
    end

    --@debug@
    if message == "debug" then
        if setDebug then
            setDebug = false
            print("|cff00FF96SoundBox|r\124|Debug:|cFFFF8040 OFF|r")
        else
            setDebug = true
            print("|cff00FF96SoundBox|r\124|Debug:|cFFFF8040 ON|r")
        end
    end
    --@end-debug@

    if message == "who" then
        if setWho then
            setWho = false
            print("|cff00FF96SoundBox|r\124|Set:|cFFFF8040 Announcer OFF|r")
        else
            setWho = true
            print("|cff00FF96SoundBox|r\124|Set:|cFFFF8040 Announcer ON|r")
        end
    end

    local channel
    if IsInGroup() then
        if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
            channel = "INSTANCE_CHAT"
        elseif IsInRaid() then
            channel = "RAID"
        elseif IsInGroup() then
            channel = "PARTY"
        end
    else
        C_ChatInfo.SendAddonMessage(addonPrefix, message, "WHISPER", playerName)
    end

    -- convert to lowercase
    message = strlower(strtrim(message))

    -- Send it:
    C_ChatInfo.SendAddonMessage(addonPrefix, message, channel)
end

C_ChatInfo.RegisterAddonMessagePrefix(addonPrefix)
