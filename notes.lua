:
---PHASE CONTROL---
-- The following will simiulate random movement for the 'phase' attribute of the sin() and cos() functions.
comp_legnth     = comp.RenderEnd
frame_rate      = ceil(comp:GetPrefs("Comp.FrameFormat.Rate"))

input           = dev.a*frame_rate
rand_rate       = frame_rate - input

-- This will animate an object from start_pos to destination in 'frame_time' frames.
-- IE: increment(0, 0.75, 60) will go from 0 to 0.75 in 60 frames.
function increment(start_pos, destination, frame_time)
    start_pos   = start_pos or 0.5
    output      = (destination - start_pos)/frame_time
    output      = (time%rand_rate) * output
    return start_pos + output
end

-- Picks a random number(s) between 0 and 1
seed            = gui.Seed

-- First seed 'rand' determines the starting point. Second seed 'rand_2' determines the destination
-- Increment() function does the animating between the two poitns.
rand_seed       = randomseed(floor(time/(rand_rate))+seed)
rand            = random(0,100)*.01

rand_seed_2     = randomseed(floor((rand_rate+time)/(rand_rate))+seed)
rand_2          = random(0,100)*.01

movement        = increment(rand, rand_2, rand_rate)

return Point(movement, 0.5)