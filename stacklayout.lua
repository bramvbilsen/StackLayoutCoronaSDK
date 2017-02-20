-----------------------------------------------------------------------------------------
--
-- stacklayout.lua
--
-----------------------------------------------------------------------------------------


-- Position references

local centerX = display.contentCenterX
local centerY = display.contentCenterY
local actualW = display.actualContentWidth
local actualH = display.actualContentHeight
local configWidth = display.contentWidth
local configHeight = display.contentHeight
local originX = display.screenOriginX
local originY = display.screenOriginY
local statusBarHeight = display.topStatusBarContentHeight

--------------------------------------------------------------------------------


local M = {}

local stackLayout = {}
local startHeight = originY
local prevObj

local function compare(a, b)
    return a.idx < b.idx
end

-- Creates stacklayout object
-- This function takes a table (params) as parameter:
--     This table may include: "y" as the value where to start the stacklayout
function M.create(params)

    -- IF params.height exists
    --    ==> make it the stacklayout startHeight
    if ((params) and (params.y)) then
        startHeight = params.y
    end



    -- Adds object to bottom of stackLayout
    -- This function takes an object (obj) and a table (params) as parameters:
    --    - This object may be a display object or a group (for groups, see later)
    --       - This table MAY include:
    --          - padding to add padding to the top of the object
    --       - This table MUST include:
    --          - if and only if the object is a group 
    function stackLayout:add(obj, params)

        -- Add object to stackLayout
        self[#self + 1] = obj
        obj.idx = #self


        -- If padding ==> Add padding
        --    ==> padding = 0
        if ((params) and (params.padding)) then
            obj.padding = params.padding
        else
            obj.padding = 0
        end


        -- If obj is a group ==> Handle the positioning
        -- NOTE THAT THE OBJECT, if a group, WILL ONLY DISPLAY CORRECT WHEN THE anchorChildren
        -- WAS FALSE BEFORE ADDING!
        if ((params) and (params.group)) then
            obj.anchorChildren = true
            obj.x = centerX
            obj.anchorX = 0.5
            obj.anchorY = 0.5
        end


        -- Sort the objects according to there index in the stackLayout
        table.sort(self, compare)


        -- Draw the objects on screen 
        -- This loop will check the indexes of all the objects and place the objects
        -- accordingly
        for i=1, #self do
            if (self[i].idx == 1) then
                self[i].y = startHeight + self[i].height*0.5 + self[i].padding
            else
                prevObj = self[i-1]
                self[i].y = prevObj.y + prevObj.height*0.5 + self[i].height*0.5 + self[i].padding
            end
        end

    end


    -- Removes and object from the stackLayout
    function stackLayout:remove(obj)

        -- Finds the obj in the stackLayout and removes it from the display and layout
        for i=1, #self do
            if (self[i] == obj) then
                display.remove(self[i])
                table.remove(self, i)
                break
            end
        end
        
        -- Reorders the objects in the stackLayout
        for i=1, #self do
            self[i].idx = i
        end

        stackLayout:refresh()
    end

    -- Redraws all the objects in the stackLayout
    function stackLayout:refresh()
    
        -- Draw the objects on screen 
        -- This loop will check the indexes of all the objects and place the objects
        -- accordingly
        for i=1, #self do
            if (self[i].idx == 1) then
                self[i].y = startHeight + self[i].height*0.5 + self[i].padding
            else
                prevObj = self[i-1]
                self[i].y = prevObj.y + prevObj.height*0.5 + self[i].height*0.5 + self[i].padding
            end
        end
    end

    -- Destroy and removes all elements in the stackLayout
    function stackLayout:destroy()
        for i=1, #self do
            display.remove(self[i])
            table.remove(self, i)
        end
        self = nil
    end

    return stackLayout
end

return M