local L = LibStub("AceLocale-3.0"):GetLocale("FastAutoRepair", false)

-- GetRepairAllCost() returns copper. 3,000 gold = 30,000,000 copper.
local MAX_AUTO_REPAIR_COST = 3000 * 10000

local function OnEvent(self, event)
    if not CanMerchantRepair() then
        return
    end

    local repairAllCost, canRepair = GetRepairAllCost()
    if not canRepair or not repairAllCost or repairAllCost <= 0 then
        return
    end

    -- Protect players against unexpectedly expensive repairs (e.g. a game bug).
    -- Repairs above the limit can still be performed manually at the merchant.
    if repairAllCost > MAX_AUTO_REPAIR_COST then
        DEFAULT_CHAT_FRAME:AddMessage(
            string.format(
                L["Repair skipped: cost %s exceeds the safety limit of %s."],
                C_CurrencyInfo.GetCoinTextureString(repairAllCost),
                C_CurrencyInfo.GetCoinTextureString(MAX_AUTO_REPAIR_COST)
            ),
            1, 0.6, 0.3
        )
        return
    end

    if repairAllCost <= GetMoney() then
        RepairAllItems(false)
        DEFAULT_CHAT_FRAME:AddMessage(
            L["Fast Auto Repair"] .. C_CurrencyInfo.GetCoinTextureString(repairAllCost),
            1, 1, 1
        )
    end
end

local f = CreateFrame("Frame")
f:SetScript("OnEvent", OnEvent)
f:RegisterEvent("MERCHANT_SHOW")
