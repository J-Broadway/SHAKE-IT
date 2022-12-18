:
function shake(val, func)
	amplitude 	= (((0.5+val) - (0.5-val))/2)
	period		= (300*(2/300)^gui.Speed)
	midpoint	= (((0.5 - val) + (0.5 + val)) / 2)
    phase       = gui.Offset
	
	if func == "sin" then
		shakeit	= amplitude * sin(2 * pi * time / period + pi/phase) + midpoint
	else
		shakeit	= amplitude * cos(2 * pi * time / period) + midpoint
	end
	return shakeit
end

return Point(shake(gui.xDev, "sin"), shake(gui.yDev, "cos"))


