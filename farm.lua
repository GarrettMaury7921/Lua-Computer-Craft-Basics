-- Farming Sugar Cane 7/29/2021

local INVENTORY_SIZE = 16
local MAIN_LOOP_INTERVAL = 420
local FUEL_CROP_CHEST_INTERVAL = 5

-- Refuel using the found fuel
function refuel(slot_number)
    turtle.select(slot_number)
    turtle.refuel()
end

-- List of accepted fuels
local ACCEPTED_FUELS = {
    "minecraft:coal_block",
    "minecraft:coal"
}

-- Check the current fuel level
function checkFuelLevel()
    
    local currentFuelLevel = turtle.getFuelLevel()
 
    if currentFuelLevel <= 0 then
        print("Out of fuel, waiting for fuel to be added. Checking for fuel every ".. FUEL_CROP_CHEST_INTERVAL .." seconds.")
        while currentFuelLevel <= 0 do
            for i = 1, INVENTORY_SIZE do
                local currentItem = turtle.getItemDetail(i)
                if currentItem ~= nil then
                    for x = 1, #ACCEPTED_FUELS do
                        if currentItem.name == ACCEPTED_FUELS[x] then
                            refuel(i)
                        end
                    end
                end
            end
            sleep(FUEL_CROP_CHEST_INTERVAL)
            currentFuelLevel = turtle.getFuelLevel()
        end
        print("Fuel added successfully, continuing...")
    end
end

-- Inventory sorting
function inventorySort()
    for j = 1, INVENTORY_SIZE do
        local currentItem = turtle.getItemDetail(j)
 
        if currentItem ~= nil then
            turtle.select(j)
            for k = j, INVENTORY_SIZE do
                if turtle.compareTo(k) then
                    turtle.select(k)
                    turtle.transferTo(j)
                    turtle.select(j)
                end
            end
        end
    end
end

--Move Function
function farmForward()
	checkFuelLevel()
    turtle.dig()
    turtle.forward()
    turtle.suckDown()
end

--Drop All Items
function dropAll()
    for j = 1, INVENTORY_SIZE do
        local currentItem = turtle.getItemDetail(j)
 
        if currentItem ~= nil then
            turtle.select(j)
            turtle.dropDown()
        end
    end
end


-- Farming
function farm()
    print("Time to Farm!")
    farmForward()
    farmForward()
    farmForward()
    farmForward()
    --Turn Left
    turtle.turnLeft()
    farmForward()
    farmForward()
    farmForward()
    farmForward()
    farmForward()
    farmForward()
    farmForward()
    farmForward()
    farmForward()
    farmForward()
    farmForward()
    turtle.turnLeft()
    farmForward()
    farmForward()
    farmForward()
    farmForward()
    --Turn Left
    turtle.turnLeft()
    farmForward()
    farmForward()
    farmForward()
    farmForward()
    farmForward()
    farmForward()
    farmForward()
    farmForward()
    farmForward()
    farmForward()
    farmForward()
    turtle.turnLeft()
    dropAll()
    inventorySort()
    print("Current Fuel is ".. turtle.getFuelLevel()..".")
end

-- Start Farming
for j = 1, 100 do
    farm()
    print("Amount of loops: ".. j ..".")
end