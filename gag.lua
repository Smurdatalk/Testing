-- Grow a Garden | Teleport All Owned Pets to Center of Garden
-- Author: @Kana (with ChatGPT)
-- Paste this into your script executor (Synapse X, Fluxus, etc.)

-- Target location (center of garden)
local gardenCenter = Vector3.new(54.73, 3.12, -110.84)

-- Check if workspace has pets
local petFolder = workspace:FindFirstChild("Pets")
if not petFolder then
    warn("No Pets folder found in workspace.")
    return
end

-- Teleport pets owned by the local player
for _, pet in ipairs(petFolder:GetChildren()) do
    -- Check ownership and PrimaryPart
    local owner = pet:FindFirstChild("Owner")
    if owner and owner.Value == game.Players.LocalPlayer then
        if pet.PrimaryPart == nil then
            pet:WaitForChild("PrimaryPart")
        end
        -- Teleport pet to center
        pet:SetPrimaryPartCFrame(CFrame.new(gardenCenter))
        -- Optionally anchor it (remove this line if not needed)
        pet.PrimaryPart.Anchored = true
    end
end

print("✅ All owned pets have been teleported to center and anchored.")
