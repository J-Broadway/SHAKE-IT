-- XY
:
x       = dofile("SHAKEIT/SHAKEIT.lua")
blend   = gui.xyBlend * gui.globalBlend

if gui.chkAdvanced == 0 then
    local xphase        = x.Phase(time, gui.Offset, gui.Seed)
    local yphase        = x.Phase(time, gui.Offset, gui.Seed + 1)

    local xyShake       = x.shake(gui.xyDev * gui.globalBlend, gui.xyDev * gui.globalBlend, xphase, gui.Speed, "sin")
    local xyShake2      = x.shake(gui.xyDev * gui.globalBlend, gui.xyDev * gui.globalBlend, yphase, gui.Speed, "cos") 
    return Point(xyShake, xyShake2)
end
if gui.chkAdvanced == 1 then
    local xphase        = x.Phase(time, gui.xyPhase, gui.xySeed)
    local yphase        = x.Phase(time, gui.xyPhase, gui.xySeed + 1)

    local xyShake       = x.shake(gui.xDev * blend, gui.xDev * blend, xphase, gui.xySpeed, "sin")
    local xyShake2      = x.shake(gui.yDev * blend, gui.yDev * blend, yphase, gui.xySpeed, "cos")

    return Point(xyShake, xyShake2)
end

-- Size
:
x       = dofile("SHAKEIT/SHAKEIT.lua")
blend   = gui.zoomBlend * gui.globalBlend

if gui.chkAdvanced ~= 1 then
    phase       = x.Phase(time, gui.Offset, gui.Seed + 2)
    shake       = x.shake(gui.zDev * gui.globalBlend, gui.zDev * gui.globalBlend, phase, gui.Speed, "sin", 1)
    return shake
else
    phase       = x.Phase(time, gui.zoomPhase, gui.zoomSeed + 2)
    shake       = x.shake(gui.zoominDev * blend, gui.zoomoutDev * blend, phase, gui.zoomSpeed, "sin", 1)
    return shake
end

-- Angle
:
x       = dofile("SHAKEIT/SHAKEIT.lua")
blend   = gui.rotationBlend * gui.globalBlend

if gui.chkAdvanced ~= 1 then
    phase       = x.Phase(time, gui.Offset, gui.Seed + 3)
    shake       = x.shake(gui.rDev * gui.globalBlend, gui.rDev * gui.globalBlend, phase, gui.Speed, "sin", 0, "No")
    return shake
else
    phase       = x.Phase(time, gui.rotationPhase, gui.rotationSeed + 3)
    shake       = x.shake(gui.clockwiseDev * blend, gui.counterDev * blend, phase, gui.rotationSpeed, "sin", 0, "No")
    return shake
end