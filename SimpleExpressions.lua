-- XY
:
x = dofile("SHAKEIT/SHAKEIT.lua")
function default(i, check, d)
    if check == 0 then
        return d
    else
        return i
    end
end

if gui.chkAdvanced == 0 then
    local xphase        = x.Phase(time, gui.Offset, gui.Seed)
    local yphase        = x.Phase(time, gui.Offset, gui.Seed + 1)

    local xyShake       = x.shake(gui.xyDev, gui.xyDev, xphase, gui.Speed, "sin")
    local xyShake2      = x.shake(gui.xyDev, gui.xyDev, yphase, gui.Speed, "cos") 
    return Point(xyShake, xyShake2)
end
if gui.chkAdvanced == 1 then
    local xphase        = x.Phase(time, gui.xyPhase, gui.xySeed)
    local yphase        = x.Phase(time, gui.xyPhase, gui.xySeed + 1)

    local xyShake       = x.shake(gui.xDev, gui.xDev, xphase, gui.xySpeed, "sin")
    local xyShake2      = x.shake(gui.yDev, gui.yDev, yphase, gui.xySpeed, "cos")
    return Point(xyShake, xyShake2)
end

-- Size
:
x = dofile("SHAKEIT/SHAKEIT.lua")

if gui.chkAdvanced ~= 1 then
    phase       = x.Phase(time, gui.Offset, gui.Seed + 2)
    shake       = x.shake(gui.zDev, gui.zDev, phase, gui.Speed, "sin", 1)
    return shake
else
    phase       = x.Phase(time, gui.zoomPhase, gui.zoomSeed + 2)
    shake       = x.shake(gui.zoominDev, gui.zoomoutDev, phase, gui.zoomSpeed, "sin", 1)
    return shake
end

-- Angle
:
x = dofile("SHAKEIT/SHAKEIT.lua")

if gui.chkAdvanced ~= 1 then
    phase       = x.Phase(time, gui.Offset, gui.Seed + 3)
    shake       = x.shake(gui.rDev, gui.rDev, phase, gui.Speed, "sin", 0, "No")
    return shake
else
    phase       = x.Phase(time, gui.rotationPhase, gui.rotationSeed + 3)
    shake       = x.shake(gui.clockwiseDev, gui.counterDev, phase, gui.rotationSpeed, "sin", 0, "No")
    return shake
end