local _, S = ...
local LSM = LibStub("LibSharedMedia-3.0")

local addonPrefix = "SoundBox"
local version = GetAddOnMetadata("SoundBox", "version")
local playerName = UnitName("player")
local soundHandle
local soundFileID = 0
local playList = {}
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
    function(_, event, prefix, message, channel, sender)
        if event == "CHAT_MSG_ADDON" and prefix == addonPrefix then
            if not setDND then
                -- we compose soundpath by feching LSM sounds using the prefix |cff00FF96SoundBox|r:

                local soundPath = LSM:Fetch("sound", "|cff00FF96SoundBox|r: " .. message, "i") -- set "i" so its not none
                local ok, _, handle = pcall(PlaySoundFile, soundPath, "Master")

                -- Once we have the soundpath, we get the handleID too

                if ok and handle ~= nil then
                    soundHandle = handle
                    soundFileID = soundFileID + 1
                    playList[soundFileID] = handle
                end

                -- we check if the announcer is on and that we actually have a valid message to print

                if setWho == true and handle ~= nil then
                    local name = Ambiguate(sender, "short")
                    print(
                    --  "|cff00FF96SoundBox|r: |cFFFF8040" .. name .. "|r |cFFFF8040played " .. message .. "|r"
                        "|TInterface\\ChatFrame\\UI-ChatIcon-ArmoryChat:14:14:0:0:16:16:0:16:0:16:0:255:150|t|cff00FF96SoundBox|r: |cFFFFFFFF" .. name .. "|r |cFFFF8040played " .. message .. "|r"
                    )
                end
                --@debug@
                if setDebug then
                    print(
                        "|cff00FF96SoundPath|r: " .. (soundPath or " ") .. "\n",
                        "|cff00FF96By|r: " .. sender .. "\n",
                        "|cff00FF96Message|r: " .. (message or " ") .. "\n",
                        "|cff00FF96In|r: " .. channel .. "\n",
                        "|cff00FF96SoundFileID|r: " .. soundFileID .. "\n",
                        "|cff00FF96Handle|r: " .. (handle or " ") .. "\n"
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
    print("|TInterface\\ChatFrame\\UI-ChatIcon-ArmoryChat:14:14:0:0:16:16:0:16:0:16:0:255:150|t|cff00FF96SoundBox|r: |cFFFFFFFFAll Sounds Stopped|r")
end

local function SoundBox_Sound(message)
    -- check if DND is on, send the message otherwise
    if not setDND then
        if IsInGroup() then
            local channel =
                (IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and "INSTANCE_CHAT") or (IsInRaid() and "RAID") or (IsInGroup() and "PARTY") or "SAY"
            C_ChatInfo.SendAddonMessage(addonPrefix, message, channel)
        else
            if message ~= "" then
                C_ChatInfo.SendAddonMessage(addonPrefix, message, "WHISPER", playerName)
            else
                print("\n|cff00FF96/sb sounds|r will display all sounds available\n")
            end
        end
    end
end

local function SoundBox_Help()
    print(
        '|cff00FF96/sb stop|r to stop all current sounds playing or set up a keybind!\n',
        '|cff00FF96/sb sounds|r will display all sounds available\n',
        '|cff00FF96SoundBox|r\124|Help: You might want to type |cff00FF96/sb "sound"|r to send sounds or\n',
        '|cff00FF96/sb dnd|r to enable or disable "Do Not Disturb" mode\n',
        '|cff00FF96/sb who|r to enable or disable the announcer\n'
    )
    print("\n|cff00FF96SoundBox|r: |cFFFF8040Version: |r" .. version)
end

local function SoundBox_List()
    local sounds = LSM:List("sound")
    for _, v in pairs(sounds) do
        if string.match(v, "|cff00FF96SoundBox|r:") then
            print(v)
        end
    end
end

-- Create Sender Slash Command

SLASH_SoundBox1 = "/sb"
SlashCmdList["SoundBox"] = function(message)
    if message then
        message = message:lower()
        SoundBox_Sound(message)
    end

    if message == "help" or message == "?" then
        SoundBox_Help()
    end

    if message == "stop" then
        SoundBox_Stop()
    end

    if message == "sounds" then
        SoundBox_List()
    end

    if message == "dnd" then
        if setDND then
            setDND = false
            print("|cff00FF96SoundBox|r\124|Set:|cFFFF8040 Do Not Disturb OFF|r")
        else
            setDND = true
            SoundBox_Stop()
            print("|cff00FF96SoundBox|r\124|Set:|cFFFF8040 Do Not Disturb ON|r")
        end
    end

    if message == "who" then
        if setWho then
            setWho = false
            print("|cff00FF96SoundBox|r\124|Set:|cFFFF8040 Announcer OFF|r")
        else
            setWho = true
            print("|cff00FF96SoundBox|r\124|Set:|cFFFF8040 Announcer ON|r")
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
end
