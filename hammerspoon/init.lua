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

function bindkeysLaunch(shortcut, app)
    hs.hotkey.bind(keys, shortcut, function() hs.application.launchOrFocus(app) end)
end

bindkeysLaunch('d', "Dictionary")
bindkeysLaunch('space', "iterm")
bindkeysLaunch('c', "Google Chrome")

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
hs.hotkey.bind(keys, 'm', function()
    local win = hs.window.focusedWindow()
    win:setFrame(win:screen():frame())
end)
hs.hotkey.bind(keys, 'y', hs.grid.resizeWindowThinner)
hs.hotkey.bind(keys, 'u', hs.grid.resizeWindowShorter)
hs.hotkey.bind(keys, 'i', hs.grid.resizeWindowTaller)
hs.hotkey.bind(keys, 'o', hs.grid.resizeWindowWider)

-- Hints
hs.hotkey.bind(keys, '.', hs.hints.windowHints)

hs.hotkey.bind(keys, 'g', hs.grid.show)

--------------------------------------------------------------------------------

-- Notify user that Hammerspoon config has loaded.
hs.notify.new({
    title='Hammerspoon',
    informativeText='Config loaded'
}):send()
