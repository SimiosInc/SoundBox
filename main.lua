local prefix = "SoundBox"
local songPath = "Interface\\AddOns\\SoundBox\\sound\\"
C_ChatInfo.RegisterAddonMessagePrefix(prefix)

SLASH_SB1 = "/sb"

function SlashCmdList.SB(option)
    if option == "ahhh" then
        PlaySoundFile(songPath .. "ahhh.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "ahhh", InstanceOrParty())
    elseif option == "allahu" then
        PlaySoundFile(songPath .. "allahu.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "allahu", InstanceOrParty())
    elseif option == "babyshark" then
        PlaySoundFile(songPath .. "babyshark.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "babyshark", InstanceOrParty())
    elseif option == "badum" then
        PlaySoundFile(songPath .. "badum.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "badum", InstanceOrParty())
    elseif option == "bryant" then
        PlaySoundFile(songPath .. "bryant.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "bryant", InstanceOrParty())
    elseif option == "cabra" then
        PlaySoundFile(songPath .. "cabra.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "cabra", InstanceOrParty())
    elseif option == "careless" then
        PlaySoundFile(songPath .. "careless.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "careless", InstanceOrParty())
    elseif option == "cato" then
        PlaySoundFile(songPath .. "cato.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "cato", InstanceOrParty())
    elseif option == "combobreaker" then
        PlaySoundFile(songPath .. "combobreaker.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "combobreaker", InstanceOrParty())
    elseif option == "delfin" then
        PlaySoundFile(songPath .. "delfin.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "delfin", InstanceOrParty())
    elseif option == "digievo" then
        PlaySoundFile(songPath .. "digievo.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "digievo", InstanceOrParty())
    elseif option == "dolly" then
        PlaySoundFile(songPath .. "dolly.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "dolly", InstanceOrParty())
    elseif option == "dungadunga" then
        PlaySoundFile(songPath .. "dungadunga.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "dungadunga", InstanceOrParty())
    elseif option == "duri" then
        PlaySoundFile(songPath .. "duri.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "duri", InstanceOrParty())
    elseif option == "esecompa" then
        PlaySoundFile(songPath .. "ese-compa.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "ese-compa", InstanceOrParty())
    elseif option == "finish" then
        PlaySoundFile(songPath .. "finish-him.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "finish-him", InstanceOrParty())
    elseif option == "garu" then
        PlaySoundFile(songPath .. "gawr-gura-a.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "gawr-gura-a", InstanceOrParty())
    elseif option == "goh" then
        PlaySoundFile(songPath .. "get_over_here.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "get_over_here", InstanceOrParty())
    elseif option == "gurgura" then
        PlaySoundFile(songPath .. "gurgura.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "gurgura", InstanceOrParty())
    elseif option == "kala" then
        PlaySoundFile(songPath .. "kala.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "kala", InstanceOrParty())
    elseif option == "krilin" then
        PlaySoundFile(songPath .. "krilin.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "krilin", InstanceOrParty())
    elseif option == "kya" then
        PlaySoundFile(songPath .. "kya.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "kya", InstanceOrParty())
    elseif option == "maduro" then
        PlaySoundFile(songPath .. "maduro-chupalo.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "maduro-chupalo", InstanceOrParty())
    elseif option == "marvel" then
        PlaySoundFile(songPath .. "marvel.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "marvel", InstanceOrParty())
    elseif option == "medusamid" then
        PlaySoundFile(songPath .. "medusa-climax.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "medusa-climax", InstanceOrParty())
    elseif option == "medusaint" then
        PlaySoundFile(songPath .. "medusa-intro.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "medusa-intro", InstanceOrParty())
    elseif option == "migattefail" then
        PlaySoundFile(songPath .. "migatte-fail.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "migatte-fail", InstanceOrParty())
    elseif option == "migatte" then
        PlaySoundFile(songPath .. "migatte.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "migatte", InstanceOrParty())
    elseif option == "modem" then
        PlaySoundFile(songPath .. "modem.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "modem", InstanceOrParty())
    elseif option == "mvc" then
        PlaySoundFile(songPath .. "mvc.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "mvc", InstanceOrParty())
    elseif option == "nani" then
        PlaySoundFile(songPath .. "nani.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "nani", InstanceOrParty())
    elseif option == "niconi" then
        PlaySoundFile(songPath .. "niconi.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "niconi", InstanceOrParty())
    elseif option == "nos" then
        PlaySoundFile(songPath .. "nos-estan-atacando.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "nos-estan-atacando", InstanceOrParty())
    elseif option == "pillarmen" then
        PlaySoundFile(songPath .. "pillarmen.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "pillarmen", InstanceOrParty())
    elseif option == "plusultra" then
        PlaySoundFile(songPath .. "plusultra.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "plusultra", InstanceOrParty())
    elseif option == "powaa" then
        PlaySoundFile(songPath .. "powaa.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "powaa", InstanceOrParty())
    elseif option == "rezero" then
        PlaySoundFile(songPath .. "rezero.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "rezero", InstanceOrParty())
    elseif option == "rosa" then
        PlaySoundFile(songPath .. "rosa.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "rosa", InstanceOrParty())
    elseif option == "timmy" then
        PlaySoundFile(songPath .. "timmy.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "timmy", InstanceOrParty())
    elseif option == "turtle" then
        PlaySoundFile(songPath .. "turtle.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "turtle", InstanceOrParty())
    elseif option == "tuturu" then
        PlaySoundFile(songPath .. "tuturu.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "tuturu", InstanceOrParty())
    elseif option == "uooooh" then
        PlaySoundFile(songPath .. "uooooh.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "uooooh", InstanceOrParty())
    elseif option == "vegeta" then
        PlaySoundFile(songPath .. "vegeta.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "vegeta", InstanceOrParty())
    elseif option == "windows" then
        PlaySoundFile(songPath .. "windows.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "windows", InstanceOrParty())
    elseif option == "wow" then
        PlaySoundFile(songPath .. "wow.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "wow", InstanceOrParty())
    elseif option == "yametekudasai" then
        PlaySoundFile(songPath .. "yametekudasai.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "yametekudasai", InstanceOrParty())
    elseif option == "yare" then
        PlaySoundFile(songPath .. "yare.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "yare", InstanceOrParty())
    elseif option == "yubarta" then
        PlaySoundFile(songPath .. "yubarta.ogg", "Master")
        C_ChatInfo.SendAddonMessage(prefix, "yubarta", InstanceOrParty())
    end
end

function InstanceOrParty()
    if (IsInGroup(LE_PARTY_CATEGORY_INSTANCE)) then
        return "PARTY"
    else
        return "RAID"
    end
end
