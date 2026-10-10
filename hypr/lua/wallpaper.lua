------------------------
--- Wallpapers setup ---
------------------------

local awww_options = " --transition-type any --transition-duration 0.3 --resize crop" -- TODO: Figure out the best resize option

local rolled_walls = {}

local function notify(text, timeout)
    if timeout == nil then
        timeout = 5000
    end

    hl.notification.create({
        text = text,
        timeout = timeout
    })
end

function SetWallpaper(ws)
    if rolled_walls[ws] ~= nil then
        hl.exec_cmd("awww img " .. rolled_walls[ws] .. awww_options)
        notify(rolled_walls[ws])
    else
        if io.open("/home/null/Wallpapers/workspaces/" .. ws) then
            hl.exec_cmd("awww img ~/Wallpapers/workspaces/" .. ws .. awww_options)
        else
            hl.exec_cmd("awww img ~/Wallpapers/workspaces/1 " .. awww_options)
        end
    end
end

-- 'magick %s[0] -resize 1x1! -colorspace Gray -format "%%[fx:mean]" info: 2>/dev/null'

local lfs = require("lfs")

Files = {}
local function scan(dir)
    for n in lfs.dir(dir) do
        local path = dir .. "/" .. n
        if lfs.attributes(path, "mode") == "file" then
            Files[#Files+1] = path
        end
    end
end

local function roll_wallpaper()
    while true do
        if #Files < 5 then
            scan("/home/null/Wallpapers/anime")
            if #Files < 5 then
                error("Files is empty")
            end
        end
        local idx = math.random(#Files)
        local file = Files[idx]

        local cmd = string.format('magick %s[0] -resize 1x1! -colorspace Gray -format "%%[fx:mean]" info: 2>/dev/null', file)

        local p = io.popen(cmd)

        local out = p:read("*a")

        p:close()

        local brightness = tonumber(out)

        local ws = hl.get_active_workspace()

        if brightness > 0.4 then
            table.remove(Files, idx)
            goto continue
        end
        rolled_walls[ws.id] = file
        hl.exec_cmd("awww img "..file..awww_options)
        notify(file)
        break

        ::continue::
    end
end

hl.on("workspace.active", function (ws) SetWallpaper(ws.id) end)

hl.bind("SUPER + G", roll_wallpaper)
hl.bind("SUPER + SHIFT + G", function () rolled_walls = {} end) -- reset the rolled wallpapers
