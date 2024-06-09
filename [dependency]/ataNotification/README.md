remplace this with qb-notify in qb-core/client/functions.lua  line 183

function QBCore.Functions.Notify(text, texttype, length)
    if type(text) == "table" then
    local ttext = text.text or 'Placeholder'
    local caption = text.caption or 'Placeholder'
    local ttype = texttype or 'primary'
    local length = length or 5000
    exports['ataNotification']:notification('far fa-keyboard text-'..ttype,"Notification","",ttext, length,'not1')
    else
    local ttype = texttype or 'primary'
    local length = length or 5000
    exports['ataNotification']:notification('far fa-keyboard text-'..ttype,"Notification","",text, length,'not1')
    end
end




