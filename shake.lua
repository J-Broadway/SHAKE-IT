:
function expCurve(x, slope, a, b)
    slope 	= slope or 100
	a		= a or 0
	b		= b or 1
	y		= a + (b-a)*((slope^x-1)/(slope-1))
    return y
end

function shake(x1, x2, phase, speed, func)
    phase       = phase or 1
    func        = func or "sin"
	amplitude 	= ((x1 - x2) / 2)
	period		= expCurve(speed, .01, 100, 2.1)
	midpoint	= ((x2 + x1) / 2)

	if func == "sin" then
		shakeit	= amplitude * sin(2 * pi * time / period + (pi*(phase*2))) + midpoint
	elseif func == "cos" then
		shakeit	= amplitude * cos(2 * pi * time / period) + midpoint
	end
	return shakeit
end

x1, y1 		= expCurve(gui.xDev), expCurve(gui.yDev)
x2, y2 		= expCurve(gui.xDev), expCurve(gui.yDev)

x1, y1 		= 0.5-x1, 0.5-y1
x2, y2 		= 0.5+x2, 0.5+y2

xPhase      = dev.randPhase.Value
yPhase      = dev.randPhase2.Value

if gui.Offset == 0 then
    return Point(shake(x2, x1, 1, gui.Speed, "sin"), shake(y1, y2, 1, gui.Speed, "cos"))
else
    return Point(shake(x2, x1, xPhase, gui.Speed, "sin"), shake(y1, y2, yPhase, gui.Speed, "cos"))
end