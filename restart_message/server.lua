
--[[𝕋𝕙𝕚𝕤 𝕊𝕔𝕣𝕚𝕡𝕥 𝕀𝕊 𝕄𝕒𝕕𝕖 𝔹𝕪 𝔸𝕝𝕝𝕖ℕ#𝟘𝟘𝟘𝟚. 𝕂𝕚𝕟𝕕𝕝𝕪 𝔻𝕠𝕟'𝕥 ℝ𝕖𝕦𝕡𝕝𝕠𝕒𝕕 𝕋𝕙𝕖 𝕊𝕔𝕣𝕚𝕡𝕥]]--


local discordWebhook = "YOUR_WEBHOOK_URL" -- Replace with your Discord webhook URL
local playerName = "Server" -- The name that will appear as the sender of the message

AddEventHandler("onResourceStart", function(resourceName)
    if GetCurrentResourceName() == resourceName then
        SendDiscordMessage("Server has restarted!")
    end
end)

function SendDiscordMessage(message)
    if discordWebhook ~= "" then
        local discordMessage = {
            ["content"] = message,
        }

        PerformHttpRequest(discordWebhook, function(err, text, headers) end, "POST", json.encode(discordMessage), {["Content-Type"] = "application/json"})
    else
        print("Discord webhook URL is missing!")
    end
end