local alert       = require "hs.alert"
local application = require "hs.application"
local fnutils     = require "hs.fnutils"
local geometry    = require "hs.geometry"
local screen      = require "hs.screen"
local window      = require "hs.window"

require("hs.ipc")

--------------------------------------------------------------------------------
-- Grid

hs.grid.MARGINX = 0
hs.grid.MARGINY = 0
hs.grid.GRIDWIDTH = 8
hs.grid.GRIDHEIGHT = 4

--------------------------------------------------------------------------------
-- Display

-- TODO: move somewhere
-- disable animation
hs.window.animationDuration = 0

local display0 = "Color LCD"
local display1 = ""

local headphones = ""
local speakers   = ""

--------------------------------------------------------------------------------
-- Hotkeys

local keys       = {"ctrl", "alt"          }
local keys_cmd   = {"ctrl", "alt", "cmd"   }
local keys_shift = {"ctrl", "alt", "shift" }

--------------------------------------------------------------------------------
-- Applications

hs.hotkey.bind(keys, 'd', function () hs.application.launchOrFocus("Dictionary") end)
hs.hotkey.bind(keys, 'space', function () hs.application.launchOrFocus("iterm") end)
hs.hotkey.bind(keys, '1', function () hs.application.launchOrFocus("MacVim") end)
hs.hotkey.bind(keys, '2', function () hs.application.launchOrFocus("Skim") end)
hs.hotkey.bind(keys, 'c', function () hs.application.launchOrFocus("Google Chrome") end)

--------------------------------------------------------------------------------
-- Window/Grid Operations

hs.hotkey.bind(keys, 'm', hs.grid.maximizeWindow)
hs.hotkey.bind(keys, ';', function() hs.grid.snap(hs.window.focusedWindow()) end)
hs.hotkey.bind(keys, "'", function() fnutils.map(hs.window.visibleWindows(), hs.grid.snap) end)

-- Grid Size
hs.hotkey.bind(keys, '=', function() hs.grid.adjustWidth( 1) end)
hs.hotkey.bind(keys, '-', function() hs.grid.adjustWidth(-1) end)
hs.hotkey.bind(keys, ']', function() hs.grid.adjustHeight( 1) end)
hs.hotkey.bind(keys, '[', function() hs.grid.adjustHeight(-1) end)

-- Focus
hs.hotkey.bind(keys, 'Left', function() hs.window.focusedWindow():focusWindowWest() end)
hs.hotkey.bind(keys, 'Right', function() hs.window.focusedWindow():focusWindowEast() end)
hs.hotkey.bind(keys, 'Up', function() hs.window.focusedWindow():focusWindowNorth() end)
hs.hotkey.bind(keys, 'Down', function() hs.window.focusedWindow():focusWindowSouth() end)

-- Monitor
hs.hotkey.bind(keys, 'n', hs.grid.pushWindowNextScreen)
hs.hotkey.bind(keys, 'p', hs.grid.pushWindowPrevScreen)

-- Move Windows
hs.hotkey.bind(keys, 'h', hs.grid.pushWindowLeft)
hs.hotkey.bind(keys, 'j', hs.grid.pushWindowDown)
hs.hotkey.bind(keys, 'k', hs.grid.pushWindowUp)
hs.hotkey.bind(keys, 'l', hs.grid.pushWindowRight)

-- Resize Windows
hs.hotkey.bind(keys, 'y', hs.grid.resizeWindowThinner)
hs.hotkey.bind(keys, 'u', hs.grid.resizeWindowShorter)
hs.hotkey.bind(keys, 'i', hs.grid.resizeWindowTaller)
hs.hotkey.bind(keys, 'o', hs.grid.resizeWindowWider)

-- Hints
hs.hotkey.bind(keys, '.', hs.hints.windowHints)

hs.hotkey.bind(keys, 'g', hs.grid.show)

--------------------------------------------------------------------------------
-- Caffeinate

local caffeine = hs.menubar.new()

function setCaffeineDisplay(state)
    if state then
        caffeine:setIcon("~/.hammerspoon/on.pdf")
    else
        caffeine:setIcon("~/.hammerspoon/off.pdf")
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

--------------------------------------------------------------------------------

--------------------------------------------------------------------------------

-- Notify user that Hammerspoon config has loaded.
hs.notify.new({
    title='Hammerspoon',
    informativeText='Config loaded'
}):send()
