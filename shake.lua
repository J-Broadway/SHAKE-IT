:
-- Returns value 'y' which turns input 'x' (from 0 to 1) into an exponential curve.
function expCurve(x, slope, a, b)
    slope 	= slope or 100
	a		= a or 0
	b		= b or 1
	y		= a + (b-a)*((slope^x-1)/(slope-1))
    return y
end

-- Shake Function
function shake(x1, x2, phase, speed, func)
	amplitude 	= ((x1 - x2) / 2)
	period		= expCurve(speed, .01, 100, 2.1)
	midpoint	= ((x2 + x1) / 2)
    phase       = phase or 1
	
	if func == "sin" then
		shakeit	= amplitude * sin(2 * pi * time / period + pi/phase) + midpoint
	elseif func == "cos" then
		shakeit	= amplitude * cos(2 * pi * time / period) + midpoint
	end
	return shakeit
end

sinPhase 	= shake(1, 1 + gui.Offset/50, 1, 0.1, "sin")

x1, y1 		= expCurve(gui.xDev), expCurve(gui.yDev)
x2, y2 		= expCurve(gui.xDev), expCurve(gui.yDev)

x1, y1 		= 0.5-x1, 0.5-y1
x2, y2 		= 0.5+x2, 0.5+y2

return Point(shake(x2, x1, sinPhase, gui.Speed, "sin"),
			 shake(y1, y2, sinPhase, gui.Speed, "cos"))
