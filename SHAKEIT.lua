local f = {}

f.debug = function()
	b = comp.RenderEnd
	return b
end

-- Creates an exponential curve based on 'slope' from points 'a' to 'b'
-- 'x' should be a slider between 0 and 1
f.expCurve = function(x, slope, a, b)
    slope 	= slope or 100
	a		= a or 0
	b		= b or 1
	y		= a + (b-a)*((slope^x-1)/(slope-1))
    return y
end

-- The following will simiulate random movement for the 'phase' attribute of the sin() and cos() functions.
f.Phase = function(time, i, s)
    frame_rate      = math.ceil(comp:GetPrefs("Comp.FrameFormat.Rate"))

    input           = i*frame_rate
    rand_rate       = frame_rate - input

    -- This will animate an object from start_pos to destination in 'frame_time' frames.
    -- IE: increment(0, 0.75, 60) will go from 0 to 0.75 in 60 frames.
    function increment(start_pos, destination, frame_time)
        start_pos   = start_pos or 0.5
        output      = (destination - start_pos)/frame_time
        output      = (time%rand_rate) * output
        
        -- If 'i' = 0 then return 0 (so there is no phase movement)
        if i == 0 then
            return 0
        else
            return start_pos + output
        end
    end

    -- Picks a random number(s) between 0 and 1
    -- First seed 'rand' determines the starting point. Second seed 'rand_2' determines the destination
    -- Increment() function does the animating between the two poitns.
    seed            = s
    rand_seed       = math.randomseed(math.floor(time/(rand_rate))+seed)
    rand            = math.random(0,100)*.01

    rand_seed_2     = math.randomseed(math.floor((rand_rate+time)/(rand_rate))+seed)
    rand_2          = math.random(0,100)*.01

    movement        = increment(rand, rand_2, rand_rate)

    return movement
end

-- Main shake function.
f.shake = function(x1, x2, phase, speed, func, center, useExp)
    center         = center or 0.5
    useExp         = useExp or "Yes"
    if useExp == "Yes" then
	    x1, x2 		= center-f.expCurve(x1), center+f.expCurve(x2)
    elseif useExp == "No" then
        x1, x2 		= center-x1, center+x2
    end
	
    phase       = phase or 1
    func        = func or "sin"
	amplitude 	= ((x1 - x2) / 2)
	period		= f.expCurve(speed, .01, 100, 2.1)
	midpoint	= ((x2 + x1) / 2)

    -- Determine which function to use
	if func == "sin" then
		shakeit	= amplitude * sin(2 * pi * time / period + (pi*(phase*2))) + midpoint
	elseif func == "cos" then
		shakeit	= amplitude * cos(2 * pi * time / period + (pi*(phase*2))) + midpoint
	end

    -- If speed is 0, there should be no movement
    if speed == 0 then
        return x1
    else
        return shakeit
    end
end

return f