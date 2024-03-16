-- keybindings.lua
local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")
local variables = require("modules.variables")

local modkey = variables.modkey
local altkey = variables.altkey

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

-- {{{ Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),
  --[[
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    ]]
      -- By-direction client focus
    awful.key({ modkey }, "j",
        function()
            awful.client.focus.global_bydirection("down")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus down", group = "client"}),
    awful.key({ modkey }, "k",
        function()
            awful.client.focus.global_bydirection("up")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus up", group = "client"}),
    awful.key({ modkey }, "h",
        function()
            awful.client.focus.global_bydirection("left")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus left", group = "client"}),
    awful.key({ modkey }, "l",
        function()
            awful.client.focus.global_bydirection("right")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus right", group = "client"}),
    --[[
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),
    
    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),

  --]]
    awful.key({ modkey, "Shift" }, "h",
        function ()
            awful.client.swap.bydirection("left")
        end,
        { description = "swap with client to the left", group = "client" }),

    awful.key({ modkey, "Shift" }, "j",
        function ()
            awful.client.swap.bydirection("down")
        end,
        { description = "swap with client below", group = "client" }),

    awful.key({ modkey, "Shift" }, "k",
        function ()
            awful.client.swap.bydirection("up")
        end,
        { description = "swap with client above", group = "client" }),

    awful.key({ modkey, "Shift" }, "l",
        function ()
            awful.client.swap.bydirection("right")
        end,
        { description = "swap with client to the right", group = "client" }),

    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),


      -- On-the-fly useless gaps change
    awful.key({ altkey, "Control" }, "=", function () lain.util.useless_gaps_resize(1) end,
        {description = "increment useless gaps", group = "tag"}),
    awful.key({ altkey, "Control" }, "-", function () lain.util.useless_gaps_resize(-1) end,
        {description = "decrement useless gaps", group = "tag"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(variables.terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey, altkey    }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey, altkey    }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key({ modkey },            "r",     function () awful.spawn.with_shell("rofi -show run") end,
              {description = "show list of commands", group = "launcher"}),

    awful.key({ modkey, "Control" }, "Tab",     function () awful.spawn.with_shell("rofi -show window") end,
              {description = "switch between windows", group = "launcher"}),
  --[[
    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
  --]]
    -- Menubar
    awful.key({ modkey }, "p", function() awful.spawn.with_shell("rofi -show drun") end,
              {description = "show the list of apps", group = "launcher"}),

  -- Brightness Keys
  awful.key({ }, "XF86MonBrightnessUp", function ()
    awful.spawn(variables.brightness_inc_cmd)
  end, {description = "brightness +", group = "hotkeys"}),

  awful.key({ }, "XF86MonBrightnessDown", function ()
    awful.spawn(variables.brightness_dec_cmd)
  end, {description = "brightness -", group = "hotkeys"}),

  -- Volume Keys
  awful.key({}, "XF86AudioLowerVolume", function ()
      awful.spawn("amixer -q -D pipewire sset Master 5%-")
  end, {description = "volume -", group = "hotkeys"}),

  awful.key({}, "XF86AudioRaiseVolume", function ()
      awful.spawn("amixer -q -D pipewire sset Master 5%+")
  end, {description = "volume +", group = "hotkeys"}),

  awful.key({}, "XF86AudioMute", function ()
      awful.spawn("amixer -D pulse set Master 1+ toggle")
  end, {description = "toggle mute", group = "hotkeys"}),

  -- Media Keys
  awful.key({}, "XF86AudioPlay", function()
      awful.spawn("playerctl play-pause")
  end, {description = "play/pause", group = "hotkeys"}),

  awful.key({}, "XF86AudioNext", function()
      awful.spawn("playerctl next")
  end, {description = "next track", group = "hotkeys"}),

  awful.key({}, "XF86AudioPrev", function()
      awful.spawn("playerctl previous")
  end, {description = "previous track", group = "hotkeys"}),
    -- Screenshot
    awful.key({ }, "Print", function ()
      awful.spawn(variables.screenshot)
    end, {description = "take screenshot", group = "launcher"}),

  -- Launch browser
  awful.key({ modkey }, "w", function ()
    awful.spawn(variables.browser)
  end, {description = "launch browser", group = "launcher"}),

  -- Launch file manager
  awful.key({ modkey }, "e", function ()
    awful.spawn(variables.file_manager)
  end, {description = "launch file manager", group = "launcher"}),

  -- Lock screen - Lock
  awful.key({ modkey, "Shift" }, "d", function ()
    awful.spawn(variables.lock)
  end, {description = "lock (lock) screen", group = "awesome"}),

  -- Lock screen
  awful.key({ modkey, "Shift" }, "f", function ()
    awful.spawn(variables.lock_black)
  end, {description = "lock screen", group = "awesome"}),

  -- Suspend
  awful.key({ modkey, "Shift" }, "s", function ()
    awful.spawn("bash -c '" .. variables.lock_black .. " && systemctl suspend'")
  end, {description = "suspend", group = "awesome"}),

  -- Toggle Picom
  awful.key({ modkey, "Control" }, "p", function ()
    if variables.is_picom_running() then
      awful.spawn("pkill picom")
      naughty.notify({text = "Picom stopped!"})
    else
      awful.spawn("picom")
      naughty.notify({text = "Picom launched!"})
    end
  end, {description = "toggle picom", group = "awesome"}),

  -- Hide/show statusbar
  awful.key({ modkey }, "b", function ()
    local myscreen = awful.screen.focused()
    myscreen.mywibox.visible = not myscreen.mywibox.visible
  end, {description = "toggle statusbar", group = "awesome"}),

  -- Layout
  awful.key({ altkey }, "Shift_L", function ()
    mykeyboardlayout.next_layout();
  end, {description = "next keyboard layout", group = "awesome"}),

awful.key({ altkey }, "h", function () variables.switchAudioPort("analog-output-headphones") end,
    { description = "Switch to headphones", group = "audio" }),

awful.key({ altkey }, "j", function () variables.switchAudioPort("analog-output-lineout") end,
    { description = "Switch to speakers", group = "audio" })

)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)



-- Set keys
root.keys(globalkeys)
-- }}}
