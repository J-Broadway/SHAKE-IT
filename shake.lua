:
function shake(x1, x2, phase, speed, func)
	amplitude 	= ((x1 - x2) / 2)
	period		= (300 * (2 / 300)^speed)
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
x1, y1 		= 0.5-gui.xDev, 0.5-gui.yDev
x2, y2 		= 0.5+gui.xDev, 0.5+gui.yDev

return Point(shake(x2, x1, sinPhase, gui.Speed, "sin"),
			 shake(y1, y2, sinPhase, gui.Speed, "cos"))
