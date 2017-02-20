-----------------------------------------------------------------------------------------
--
-- main.lua
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

-- StackLayout Example

local widget = require( "widget" )


-- IMPORTING THE MODULE
local stackLayoutLib = require("Stacklayout")


-- CREATING THE STACKLAYOUT
local stackLayout = stackLayoutLib.create({
    y = originY,
})


-- CREATING AND ADDING A GROUP ( NOTE THAT THE OBJECT, if a group, 
-- WILL ONLY DISPLAY CORRECT WHEN THE anchorChildren WAS FALSE BEFORE ADDING!)
local circle1 = display.newCircle(originX + centerY*0.2, centerY, centerX*0.2)
local circle2 = display.newCircle(centerX, centerY, centerX*0.2)
local circle3 = display.newCircle(actualW - centerY*0.2, centerY, centerX*0.2)
local circleGroup = display.newGroup()
circleGroup:insert(circle1) circleGroup:insert(circle2) circleGroup:insert(circle3)
print(circleGroup.y)
stackLayout:add(circleGroup, {
    group = true
})


-- ADDING DISPLAY OBJECTS
local firstRect = display.newRect(centerX, centerY, actualW, centerY * 0.3)
firstRect:setFillColor(1)
stackLayout:add(firstRect)

local secondRect = display.newRect(centerX, centerY, actualW, centerY * 0.5)
secondRect:setFillColor(.5, 0.5, 0.5)
stackLayout:add(secondRect)

local lastRect = display.newRect(centerX, centerY, actualW, centerY * 0.3)
lastRect:setFillColor(1, 0.5, 0.5)
stackLayout:add(lastRect)

local meh = display.newRect(centerX, centerY, actualW, centerY * 0.3)
meh:setFillColor(1, 0.5, 1)
stackLayout:add(meh)


-- ADDING A WIDGET (button)
local button1 = widget.newButton(
    {
        label = "button",
        onEvent = handleButtonEvent,
        emboss = false,
        -- Properties for a rounded rectangle button
        shape = "roundedRect",
        width = 200,
        height = 40,
        cornerRadius = 2,
        fillColor = { default={1,0,0,1}, over={1,0.1,0.7,0.4} },
        strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} },
        strokeWidth = 4
    }
)
button1.x = centerX
stackLayout:add(button1)


-- ADDING DISPLAY OBJECTS
local mehh = display.newRect(centerX, centerY, actualW, centerY * 0.3)
mehh:setFillColor(1, 1, 0.5)
mehh.alpha = 1
stackLayout:add(mehh)


-- REMOVING ITEMS FROM THE STACKLAYOUT
stackLayout:remove(secondRect)
stackLayout:remove(lastRect)


local groupRect1 = display.newRect(originX + centerX * 0.2, centerY, centerX * 0.4, centerY * 0.5)
local groupRect2 = display.newRect(centerX, centerY, centerX * 0.4, centerY * 0.6)
local groupRect3 = display.newRect(actualW - centerX * 0.2, centerY, centerX * 0.4, centerY * 0.2)
local rectGroup = display.newGroup()
rectGroup:insert(groupRect1) rectGroup:insert(groupRect2) rectGroup:insert(groupRect3)
stackLayout:add(rectGroup, {
    group = true
})


-- ADDING DISPLAY OBJECTS WITH PADDING
local lastRect = display.newRect(centerX, centerY, actualW, centerY * 0.3)
lastRect:setFillColor(.4, .76, 0.35)
stackLayout:add(lastRect, {
    padding = 10
})

--------------------------------------------------------------------------------