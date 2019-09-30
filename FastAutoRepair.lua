local function OnEvent(self, event)
	if (CanMerchantRepair()) then	
		repairAllCost, canRepair = GetRepairAllCost();
		if (canRepair and repairAllCost > 0) then
			guildRepairedItems = false
			if (repairAllCost <= GetMoney() and not guildRepairedItems) then
				RepairAllItems(false);
				DEFAULT_CHAT_FRAME:AddMessage("|cffd6266cFast Auto Repair:|cffffcc00Equipment has been repaired for "..GetCoinTextureString(repairAllCost), 255, 255, 255)
			end
		end
	end
end


local f = CreateFrame("Frame")
f:SetScript("OnEvent", OnEvent);
f:RegisterEvent("MERCHANT_SHOW");
