local prefix = "SoundBox"
local songPath = "Interface\\AddOns\\SoundBox\\sound\\"
local playerName = UnitName("player")

-- -----
--   SOUNDS TABLE
-- -----
local sounds = {
    aiuda = "aiuda", 
    allahu = "allahu", 
    babyshark = "babyshark", 
    badum = "badum", 
    bruh = "bruh", 
    bryant = "bryant", 
    cabra = "cabra", 
    careless = "careless", 
    cato = "cato", 
    combo = "combo", 
    delfin = "delfin", 
    digievo = "digievo", 
    dolly = "dolly", 
    dungadunga = "dungadunga", 
    duri = "duri", 
    esecompa = "ese_compa", 
    finishhim = "finish_him", 
    gura = "gawr_gura_a", 
    goh = "get_over_here", 
    giorno = "giorno", 
    gurgura = "gurgura", 
    kala = "kala", 
    krillin = "krillin", 
    kya = "kya", 
    maduro = "maduro_chupalo", 
    mvc = "marvel_versus", 
    mclimax = "medusa_climax", 
    mintro = "medusa_intro", 
    migatte = "migatte", 
    migattefail = "migatte_fail", 
    missioncomplete = "missioncomplete", 
    modem = "modem", 
    nani = "nani", 
    niconi = "niconi", 
    nos = "nos_estan_atacando", 
    pillarmen = "pillarmen", 
    plusultra = "plusultra", 
    powaa = "powaa", 
    rezero = "rezero", 
    rosa = "rosa", 
    turtle = "turtle", 
    tuturu = "tuturu", 
    uoh = "uoh", 
    timmy = "vamos_timmy", 
    vcf = "vcf", 
    vegeta = "vegeta", 
    windows = "windows", 
    wow = "wow", 
    yametekudasai = "yametekudasai", 
    yare = "yare", 
    yubarta = "yubarta", 
    zawarudo = "zawarudo" 
 }

local f = CreateFrame("Frame")
f:RegisterEvent("CHAT_MSG_ADDON")
f:SetScript(
    "OnEvent",
    function(self, event, prefix, message, channel, sender)
        if prefix ~= "SoundBox" then
            return
        end

        local soundFile = sounds[message]
        if not soundFile then
            return
        end

        PlaySoundFile(songPath .. soundFile .. ".ogg", "Master")

        -- --[[ Debug
        print("\n"..
            "|cff00FF96Prefix|r:" .. prefix.. "\n",
            "|cff00FF96Path|r:" .. songPath.. "\n" ,
            "|cff00FF96File|r:" .. soundFile.. "\n" ,
            "|cff00FF96By|r:" .. sender.. "\n" ,
            "|cff00FF96In|r:" .. channel.. "\n" 
        ) 
        -- --]]
    end
)

SLASH_SB1 = "/sb"
SlashCmdList.SB = function(message)
    -- Find the right channel for your current group type:
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
        C_ChatInfo.SendAddonMessage(prefix, message, "WHISPER", playerName)
    end
    -- convert to lowercase so it will match the table keys:
    message = strlower(strtrim(message))

    -- Send it:
    C_ChatInfo.SendAddonMessage(prefix, message, channel)
end

C_ChatInfo.RegisterAddonMessagePrefix(prefix)
