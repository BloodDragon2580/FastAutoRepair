local L = LibStub("AceLocale-3.0"):GetLocale("FastAutoRepair", false)

local function OnEvent(self, event)
    if not CanMerchantRepair() then
        return
    end

    local repairAllCost, canRepair = GetRepairAllCost()
    if canRepair and repairAllCost and repairAllCost > 0 and repairAllCost <= GetMoney() then
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
