-- CONFIGURATION FILE FOR AWESOME 3.4.15 
-- FOR USE ON DEVUAN JESSIE

-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
--require("awful.menu_keys")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")

-- Load Debian menu entries
require("debian.menu")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.add_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init("/home/mpurcell/.config/awesome/themes/wombat/theme.lua")
--beautiful.init("/home/mpurcell/.config/awesome/themes/wombat/theme.lua")
--beautiful.init("/usr/share/awesome/themes/default/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "x-terminal-emulator"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod1"

awful.menu.menu_keys = { up = { "u" }, down = { "e" }, exec = { "Return" } }

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating, --1
    awful.layout.suit.tile, --2
    awful.layout.suit.tile.left, --3
    awful.layout.suit.tile.bottom, --4
    awful.layout.suit.tile.top, --5
    awful.layout.suit.fair, --6
    awful.layout.suit.fair.horizontal, --7
    awful.layout.suit.spiral, --8
    awful.layout.suit.spiral.dwindle, --9
    awful.layout.suit.max, --10
    --awful.layout.suit.max.fullscreen, --11
    awful.layout.suit.magnifier --11
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    --this one requires 12pt sans to see well
    tags[s] = awful.tag({ "Ͳ ", "Ѡ ", "ℇ ", "◎ ", "⋎ ", "Å ", "Ƞ ", "⊂ ", "Ѕ " }, s, { layouts[2], layouts[2], layouts[1], layouts[2], layouts[2], layouts[1], layouts[1], layouts[3], layouts[8] })
    --these are fine at 10pt sans
    --tags[s] = awful.tag({ "➀ ", "➁ ", "➂ ", "➃ ", "➄ ", "➅ ", "➆ ", "➇ ", "➈ " }, s, { layouts[2], layouts[2], layouts[1], layouts[2], layouts[2], layouts[1], layouts[1], layouts[3], layouts[1] })
    --tags[s] = awful.tag({ "➊⁜ ", "➋⁜ ", "➌⁜ ", "➍⁜ ", "➎⁜ ", "➏⁜ ", "➐⁜ ", "➑⁜ ", "➒⁜ " }, s, { layouts[2], layouts[2], layouts[1], layouts[2], layouts[2], layouts[1], layouts[1], layouts[3], layouts[1] })
    --tags[s] = awful.tag({ "➊ ≻", "➋ ≻", "➌ ≻", "➍ ≻", "➎ ≻", "➏ ≻", "➐ ≻", "➑ ≻", "➒ ≻" }, s, { layouts[2], layouts[2], layouts[1], layouts[2], layouts[2], layouts[1], layouts[1], layouts[3], layouts[1] })
    --tags[s] = awful.tag({ "➊ ➔", "➋ ➔", "➌ ➔", "➍ ➔", "➎ ➔", "➏ ➔", "➐ ➔", "➑ ➔", "➒ ➔" }, s, { layouts[2], layouts[2], layouts[1], layouts[2], layouts[2], layouts[1], layouts[1], layouts[3], layouts[1] })
    --tags[s] = awful.tag({ "➊ ⋮", "➋ ⋮", "➌ ⋮", "➍ ⋮", "➎ ⋮", "➏ ⋮", "➐ ⋮", "➑ ⋮", "➒ " }, s, { layouts[2], layouts[2], layouts[1], layouts[2], layouts[2], layouts[1], layouts[1], layouts[3], layouts[1] })
    --tags[s] = awful.tag({ "➊ ⋱", "➋ ⋰", "➌ ⋱", "➍ ⋰", "➎ ⋱", "➏ ⋰", "➐ ⋱", "➑ ⋰", "➒ !" }, s, { layouts[2], layouts[2], layouts[1], layouts[2], layouts[2], layouts[1], layouts[1], layouts[3], layouts[1] })
    --tags[s] = awful.tag({ "➊ ╱", "➋ ╱", "➌ ╱", "➍ ╱", "➎ ╱", "➏ ╱", "➐ ╱", "➑ ╱", "➒ ╱" }, s, { layouts[2], layouts[2], layouts[1], layouts[2], layouts[2], layouts[1], layouts[1], layouts[3], layouts[1] })
    --tags[s] = awful.tag({ "➊ ╳", "➋ ╳", "➌ ╳", "➍ ╳", "➎ ╳", "➏ ╳", "➐ ╳", "➑ ╳", "➒ " }, s, { layouts[2], layouts[2], layouts[1], layouts[2], layouts[2], layouts[1], layouts[1], layouts[3], layouts[1] })
end
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "programs", debian.menu.Debian_menu.Debian },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = mymainmenu })
-- }}}

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" }, " &#10094; %a, %b %e &#10094;<span color='#ffff44'> %l:%M</span> ", 60 )

-- Create a millenium falcon widget
mfwidget = widget({ type = "textbox" })                                    
mfwidget.text = "<span color='#ccc'>✴ The Millennium Falcon </span>&#10094; "                                            

-- Create a Weather widget
weatherwidget = widget({ type = "textbox" })                                    
weatherwidget.text = " &#10094; ..."                                            
weatherwidgettimer = timer({ timeout = 180 })          
weatherwidgettimer:add_signal("timeout",                                        
  function()                                                                    
    fh = assert(io.popen("wget -q -O- https://www.wunderground.com/us/wa/seattle |grep temp_now | cut -d' ' -f 2 | sed 's/^.//'", "r"))                       
    --the open function outputs a file, so you need to read that file to use its contents
    local temp = fh:read("*n")
    if not temp then 
        weatherwidget.text = "&#10094; " .. '<span color="#777">OFF</span>' 
    else
        weatherwidget.text = " &#10094; " .. '<span color="#ff66cc">' .. "☔ " .. temp .. "F" .. '</span>'
    end
    fh:close()                                                                  
  end                                                                           
)                                                                               
weatherwidgettimer:start()

-- Create a volume status widget
volumewidget = widget({ type = "textbox" })                                    
volumewidget.text = "&#10094; ..."                                            
volumewidgettimer = timer({ timeout = 1 })          
volumewidgettimer:add_signal("timeout",                                        
  function()                                                                    
    level = assert(io.popen("amixer scontents | grep 'Front Left: Pl' | cut -d'[' -f2 | sed 's/][[:space:]]//'", "r"))                       
    isvolumeon = assert(io.popen("amixer scontents | grep 'Front Left: Pl' | cut -d' ' -f8", "r"))                       
    if string.find(isvolumeon:read("*l"), "on") then
        volumewidget.text = "  &#10094; " .. '<span color="#ff6600">' .. "V " .. level:read("*l") .. '</span>'
    else
        volumewidget.text = "  &#10094; " .. '<span color="#ffffff">MUTE</span>'
    end
    level:close()                                                                  
    isvolumeon:close()                                                                  
  end                                                                           
)                                                                               
volumewidgettimer:start()

-- Create a volume status widget
volumewidget2 = widget({ type = "textbox" })                                    
volumewidget2.text = "&#10094; ..."                                            
volumewidget2timer = timer({ timeout = 1 })          
volumewidget2timer:add_signal("timeout",                                        
  function()                                                                    
    level = assert(io.popen("amixer scontents | grep 'Front Left: Pl' | cut -d'[' -f2 | sed 's/][[:space:]]//'", "r"))                       
    isvolumeon = assert(io.popen("amixer scontents | grep 'Front Left: Pl' | cut -d' ' -f8", "r"))                       
    if string.find(isvolumeon:read("*l"), "on") then
        volumewidget2.text = ' ' .. '<span color="#ff6600">' .. level:read("*l") .. '</span>'
    else
        volumewidget2.text = ' ' .. '<span color="#ffffff">MUTE</span>'
    end
    level:close()                                                                  
    isvolumeon:close()                                                                  
  end                                                                           
)                                                                               
volumewidget2timer:start()

-- Create a RAM widget
ramwidget = widget({ type = "textbox" })                                    
ramwidget.text = " &#10094; ..."                                            
ramwidgettimer = timer({ timeout = 5 })          
ramwidgettimer:add_signal("timeout",                                        
  function()                                                                    
    fh = assert(io.popen("free -h | grep + | cut -d' ' -f 9", "r"))                       
    value = assert(io.popen("free -h | grep + | cut -d' ' -f 9 | sed 's/.$//' ", "r"))
    --the open function outputs a file, so you need to read that file before using its contents
    value = value:read("*n")
    if value < 8 then
        ramwidget.text = " &#10094; " .. '<span color="#ff2222">' .. fh:read("*l") .. '</span>'
    else
        ramwidget.text =  " &#10094; " .. '<span color="#6666aa">' .. fh:read("*l") .. '</span>'
    end
    fh:close()                                                                  
  end                                                                           
)                                                                               
ramwidgettimer:start()

-- Create a systray
mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "bottom", screen = s })
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
            mylauncher,
            mytaglist[s],
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        mylayoutbox[s],
        mytextclock or nil,
        --weatherwidget or nil,
        --ramwidget or nil,
        --s == 1 and volumewidget or nil,
        --s == 2 and volumewidget2 or nil,
        s == 1 and mysystray or nil,
        s == 1 and mfwidget or nil,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey, "Control" }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey, "Control" }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    --awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- keyboard sound buttons 
    awful.key({ }, "XF86AudioRaiseVolume", function () awful.util.spawn("amixer set Master playback 5%+", false) end),
    awful.key({ }, "XF86AudioLowerVolume", function () awful.util.spawn("amixer set Master playback 5%-", false) end),
    awful.key({ }, "XF86AudioMute", function () awful.util.spawn("amixer sset Master toggle", false) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey,           }, "w", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey, "Shift"   }, "t", awful.titlebar.toggle),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "t", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Shift"   }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),
    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    --keybind to see app switcher
    awful.key({ modkey,           }, ",",     function () 
        if instance then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({ width=250, color="#111111" }) 
        end
    end),

-- Launch Programs!!!
    awful.key({ modkey, "Shift"   }, "a", function () awful.util.spawn_with_shell("/home/mpurcell/bin/awesome_autostart.sh") end),
    awful.key({ modkey            }, "c", function () awful.util.spawn("google-chrome") end),
    awful.key({ modkey, "Control" }, "c", function () awful.util.spawn("/home/mpurcell/bin/qutebrowser") end),
    awful.key({ modkey,           }, "e", function () awful.util.spawn("icedove") end),
    awful.key({ modkey            }, "m", function () awful.util.spawn('xfce4-terminal -T mutt --geometry 119x50 --command="mutt"') end), 
    awful.key({ modkey            }, "r", function () awful.util.spawn('xfce4-terminal -T rainmutt --geometry 119x50 --command="mutt -F ~/.mutt/rainmuttrc"') end), 
    awful.key({ modkey,           }, "f", function () awful.util.spawn("spacefm") end), 
    awful.key({ modkey, "Control" }, "g", function () awful.util.spawn("geany") end), 
    awful.key({ modkey, "Control" }, "m", function () awful.util.spawn('xfce4-terminal -T htop --command="htop"') end),
    awful.key({ modkey, "Control" }, "i", function () awful.util.spawn('xfce4-terminal -T irssi --geometry 119x50 --command="irssi"') end),
    awful.key({ modkey,           }, "n", function () awful.util.spawn("nitrogen") end),
    --awful.key({ modkey, "Control" }, "n", function () awful.util.spawn('xfce4-terminal -T newsbeuter --geometry 119x50 --command="newsbeuter"') end),
    awful.key({ modkey, "Control" }, "o", function () awful.util.spawn("libreoffice --nologo") end), 
    awful.key({ modkey,           }, "p", function () awful.util.spawn('xfce4-terminal -T pianobar --geometry 119x40 --command="pianobar"') end),
    --awful.key({ modkey, "Control" }, "t", function () awful.util.spawn("tor-browser") end), 
    awful.key({ modkey, "Control" }, "v", function () awful.util.spawn("audacious") end),
    awful.key({ modkey,           }, "v", function () awful.util.spawn("virtualbox") end),
    awful.key({ modkey,           }, "x", function () awful.util.spawn("xcalc") end),
    awful.key({ modkey,           }, "y", function () awful.util.spawn('xfce4-terminal -T awesome-config --command="vi /home/mpurcell/.config/awesome/rc.lua"') end),

    -- Prompt to run programs
    awful.key({ modkey },            "i",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey,           }, ";",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

clientkeys = awful.util.table.join(
    --awful.key({ modkey,           }, "q",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey,           }, "z",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),

--keyboard commands to manipulate floating windows
    --Shrink a floating client window from the right
    awful.key({ modkey            }, "Home",   function () awful.client.moveresize( 0, 0, -40, -0) end), 
    --Enlarge a floating client window to the right
    awful.key({ modkey            }, "End",    function () awful.client.moveresize( 0, 0, 40, -0) end),    
    --Shrink a floating client window from the right and bottom (pageup key)
    awful.key({ modkey            }, "Prior",  function () awful.client.moveresize( 0, 0, -0, -40) end),
    --Enlarge a floating client window to the right and bottom (the pagedown key)
    awful.key({ modkey            }, "Next",   function () awful.client.moveresize( 0, 0,  0,  40) end),
    --Move a floating client window down (no resize)
    awful.key({ modkey            }, "Down",   function () awful.client.moveresize(  0,  20,   0,   0) end),
    --Move a floating client window up (no resize)
    awful.key({ modkey            }, "Up",     function () awful.client.moveresize(  0, -20,   0,   0) end),
    --Move a floating client window left (no resize)
    awful.key({ modkey            }, "Left",   function () awful.client.moveresize(-20,   0,   0,   0) end),
    --Move a floating client window right (no resize)
    awful.key({ modkey            }, "Right",  function () awful.client.moveresize( 20,   0,   0,   0) end),

    awful.key({ modkey, "Control"   }, "r",      function (c) c:redraw()                       end),
    --awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "a",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "q",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        --if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            --and awful.client.focus.filter(c) then
            --client.focus = c
        --end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
            awful.placement.centered(c)
        end
    end
end)

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                 border_color = beautiful.border_normal,
                 focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "google-chrome" }, properties = { tag = tags[1][2], switchtotag = true } },
    { rule = { class = "Chromium" }, properties = { tag = tags[1][2], switchtotag = true } },
    { rule = { class = "[Qq]utebrowser" }, properties = { tag = tags[1][2], switchtotag = true } },
    { rule = { class = "Iceweasel" }, properties = { tag = tags[1][2], switchtotag = true } },
    { rule = { class = "Icedove" }, properties = { tag = tags [1][3], switchtotag = true } },
    { rule = { name = "mutt" }, properties = { tag = tags [1][3], switchtotag = true } },
    --{ rule = { name = "rainmutt" }, properties = { tag = tags [2][3], switchtotag = true } },
    { rule = { class = "[Ll]ibre[Oo]ffice*" }, properties = { tag = tags [1][4], switchtotag = true } },
    { rule = { name = "awesome-config" }, properties = { switchtotag = true, tag = tags [1][5] } },
    { rule = { class = "[Gg]imp" }, properties = { floating = true, switchtotag = true, tag = tags [1][6] } },
    --{ rule = { class = "Gnome-mplayer" }, properties = { tag = tags [1][6], switchtotag = true } },
    { rule = { class = "Audacious" }, properties = { floating = true, tag = tags [screen.count()][6], switchtotag = true } },
    { rule = { name = "pianobar" }, properties = { floating = true, tag = tags [screen.count()][6], switchtotag = true } },
    { rule = { class = "VirtualBox" }, properties = { floating = true, tag = tags [1][6], switchtotag = true } },
    { rule = { name = "newsbeuter" }, properties = { floating = true, tag = tags [1][7], switchtotag = true, x = 240, y = 20 } },
    { rule = { name = "irssi" }, properties = { floating = true, tag = tags [1][8], switchtotag = true, x = 40, y = 20 } },
    { rule = { class = "XCalc" }, properties = { floating = true, tag = tags [1][9], switchtotag = true } },
    { rule = { class = "Nitrogen" }, properties = { floating = true, tag = tags [1][9], switchtotag = true, x = 40, y = 40 } },
    { rule = { name = "htop" }, properties = { tag = tags [screen.count()][9], floating = false, switchtotag = true } },

    --make these always open as floating:
    { rule = { class = "Pavucontrol" }, properties = { floating = true } },
    { rule = { name = "File Operation Progress" }, properties = { floating = true } },
    --or not
    { rule = { class = "Spacefm" }, properties = { floating = false } },
    --make SpaceFM's confirm delete dialogue float
    { rule = { name = "Confirm Delete" }, properties = { floating = true } },
    { rule = { class = "MPlayer" }, properties = { floating = true } },
    { rule = { class = "pinentry" }, properties = { floating = true } },
    { rule = { class = "Lxappearance" }, properties = { floating = true } },
    { rule = { class = "gimp" }, properties = { floating = true } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
-- }}}


client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

awful.util.spawn_with_shell("/home/mpurcell/bin/awesome_autostart.sh")

--EOF--
