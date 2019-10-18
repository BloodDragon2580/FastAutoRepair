local L = LibStub("AceLocale-3.0"):GetLocale("FastAutoRepair", false)

local function OnEvent(self, event)
	if (CanMerchantRepair()) then	
		repairAllCost, canRepair = GetRepairAllCost();
		if (canRepair and repairAllCost > 0) then
			guildRepairedItems = false
			if (repairAllCost <= GetMoney() and not guildRepairedItems) then
				RepairAllItems(false);
				DEFAULT_CHAT_FRAME:AddMessage(L["Fast Auto Repair"]..GetCoinTextureString(repairAllCost), 255, 255, 255)
			end
		end
	end
end


local f = CreateFrame("Frame")
f:SetScript("OnEvent", OnEvent);
f:RegisterEvent("MERCHANT_SHOW");
