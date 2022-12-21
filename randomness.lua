:
--Default Variables
input           = dev.a
comp_legnth     = comp.RenderEnd
frame_rate      = ceil(comp:GetPrefs("Comp.FrameFormat.Rate"))

input           = input*frame_rate
seed            = randomseed(floor(time/(frame_rate-input)))
rand            = random(0,100)*.01
rand_rate       = frame_rate - input


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
