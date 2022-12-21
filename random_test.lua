:
--Default Variables
input           = dev.a*frame_rate
comp_legnth     = comp.RenderEnd
frame_rate      = ceil(comp:GetPrefs("Comp.FrameFormat.Rate"))

rand_rate       = frame_rate - input
seed            = randomseed(floor((rand_rate+time)/(rand_rate))+1446)
rand            = random(0,100)*.01

function increment(start_pos, destination, frame_time)
    start_pos   = start_pos or 0.5
    output      = (destination - start_pos)/frame_time
    output      = (time%rand_rate) * output
    return start_pos + output
end

desti = increment(0.5, rand, rand_rate)

return rand
-- return Point(rand, 0.5)
-- return Point(desti, 0.5)

:
--Default Variables
input           = dev.a*frame_rate
comp_legnth     = comp.RenderEnd
frame_rate      = ceil(comp:GetPrefs("Comp.FrameFormat.Rate"))

rand_rate       = frame_rate - input
seed            = randomseed(floor(time/(rand_rate))+1446)
rand            = random(0,100)*.01

function increment(start_pos, destination, frame_time)
    start_pos   = start_pos or 0.5
    output      = (destination - start_pos)/frame_time
    output      = (time%rand_rate) * output
    return start_pos + output
end

desti = increment(0.5, rand, rand_rate)

return rand