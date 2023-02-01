t = comp.CurrentTime
if tool.chkAdvanced[t] == 0 then
    tool.globalBlend = 1
    tool.rCenter = {0.5, 0.5}
    tool.xyDev = 0.1
    tool.zDev = 0
    tool.rDev = 0
    tool.Speed = 0.5
    tool.Offset = 0.1
    tool.Seed = 1
elseif tool.chkAdvanced[t] == 1 then
    tool.globalBlend = 1
    tool.rCenter = {0.5, 0.5}
    tool.xDev = 0
    tool.yDev = 0
    tool.xySpeed = 0.5
    tool.xyPhase = 0.1
    tool.xySeed = 1
    tool.xyBlend = 1
    tool.zoominDev = 0
    tool.zoomoutDev = 0
    tool.zoomSpeed = 0.5
    tool.zoomPhase = 0.1
    tool.zoomSeed = 1
    tool.zoomBlend = 1
    tool.clockwiseDev = 0
    tool.counterDev = 0
    tool.rotationSpeed = 0.5
    tool.rotationPhase = 0.1
    tool.rotationSeed = 1
    tool.rotationBlend = 1
end