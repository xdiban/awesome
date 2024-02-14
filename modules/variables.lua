-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
local M = {}
local awful = require("awful")
local naughty = require("naughty")
M.menubar = require("menubar")
M.theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), "hyper")

-- This is used later as the default terminal and editor to run.
M.terminal = "kitty"
M.editor = os.getenv("EDITOR") or "nvim"
M.browser = "firefox"
M.screenshot = "flameshot gui"
M.lock = "betterlockscreen --lock"
M.lock_lock = "xtrlock"
M.ile_manager = "pcmanfm"

M.is_picom_running = function ()
    local result = io.popen("pgrep picom"):read("*l")
    return result ~= nil
end

-- Check Laptop
M.is_laptop = os.execute("test -d \"/proc/acpi/button/lid\"") and true or false

M.brightness_inc_cmd = M.is_laptop and "brightnessctl set +5%" or "ddcutil setvcp 10 + 10"
M.brightness_dec_cmd = M.is_laptop and "brightnessctl set 5%-" or "ddcutil setvcp 10 - 10"

-- Function to switch between headphone and speaker ports
M.switchAudioPort = function (port)
    awful.spawn.easy_async(string.format("pactl set-sink-port 0 %s", port), function(_, stderr)
        if stderr and not stderr:match("^$") then
            naughty.notify({
                preset = naughty.config.presets.critical,
                title = "Audio Port Switch",
                text = "Failed to switch audio port",
            })
        else
            naughty.notify({
                preset = naughty.config.presets.normal,
                title = "Audio Port Switch",
                text = string.format("Switched to %s", port),
            })
        end
    end)
end

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
M.modkey = "Mod4"
M.altkey = "Mod1"

-- Table of layouts to cover with awful.layout.inc, order matters.
M.awful = {}
M.awful.layout = {}
M.awful.layout.layouts = {
    awful.layout.suit.tile,
    --awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    --awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.magnifier,
    --awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
    awful.layout.suit.floating,
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu_submenu_icon
--[[
myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })
--]]
--[[                       
mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })
--]]
-- Menubar configuration
M.menubar.utils.terminal = M.terminal -- Set the terminal for applications that require it
-- }}}

return M
