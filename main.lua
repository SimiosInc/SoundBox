local _, S = ...

local addonPrefix = "SoundBox"
local version = GetAddOnMetadata("SoundBox", "version")
local folderName = "Interface\\AddOns\\SoundBox\\sound\\"
local playerName = UnitName("player")
local soundHandle
local soundFileID = 0
local playList = {}
local sounds = S
local setWho = true
local setDND = false
local setDebug = false

-- Register addon prefix

C_ChatInfo.RegisterAddonMessagePrefix(addonPrefix)

-- Register Keybinding globals

_G["BINDING_HEADER_SoundBox"] = "|cff00FF96SoundBox|r"
_G["BINDING_HEADER_SOUNDBOX_KEYBIND_ALLSOUNDS"] = "All Sounds"
_G["BINDING_NAME_SOUNDBOX_STOP_SOUND"] = "Stop Sound"

-- Create listener Frame

local f = CreateFrame("Frame")
f:RegisterEvent("CHAT_MSG_ADDON")
f:SetScript(
    "OnEvent",
    function(self, event, prefix, message, channel, sender)
        if event == "CHAT_MSG_ADDON" and prefix == addonPrefix then

            -- compare the message with our sounds table

            local fileName = sounds[message]
            if not fileName then
                return
            end

            -- we check if DND is on, proceed otherwise

            if not setDND then

                -- we compose sound file path

                local soundPath = folderName .. fileName .. ".ogg"
                local ok, _, handle = pcall(PlaySoundFile, soundPath, "Master")

                -- Once we have the soundpath, we get the handleID too

                if ok then
                    soundHandle = handle
                    soundFileID = soundFileID + 1
                    playList[soundFileID] = handle
                end

                -- we check if the announcer is on and that we actually have a valid message to print

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
                        "|cff00FF96Handle|r: " .. handle
                    )
                end
                --@end-debug@
            end
        end
    end
)

-- function to stop all sounds

function SoundBox_Stop()
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

-- Create Sender Slash Command

SLASH_SB1 = "/sb"
SlashCmdList.SB = function(message)
    if message == "stop" then
        SoundBox_Stop()
    end

    if message == "version" then
        print("|cff00FF96SoundBox|r: |cFFFF8040Version: |r" .. version)
    end

    if message == "sounds" then
        local s = ""
        for k, _ in pairs(sounds) do
            s = s .. k .. ", "
        end
        print("|cff00FF96SoundBox|r\124|Sounds: /sb |r" .. s)
    end

    if message == "help" or message == "?" or message == "" then
        print(
            '|cff00FF96SoundBox|r\124|Help: You might want to type |cff00FF96/sb "sound"|r to send sounds or\n',
            "|cff00FF96/sb stop|r to stop all current sounds playing or set up a keybind!\n",
            "|cff00FF96/sb sounds|r will display all sounds available\n",
            '|cff00FF96/sb dnd|r to enable or disable "Do Not Disturb" mode\n',
            "|cff00FF96/sb who|r to enable or disable the announcer\n",
            "|cff00FF96/sb version|r to see what version you are running"
        )
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

    -- Set up the channel depending of group or solo

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

    -- convert message to lowercase

    message = strlower(strtrim(message))

    -- check if DND is on, send the message otherwise

    if not setDND then
        C_ChatInfo.SendAddonMessage(addonPrefix, message, channel)
    end

end
