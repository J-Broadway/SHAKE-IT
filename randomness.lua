:
function randPhase(i, s)
    comp_legnth     = comp.RenderEnd
    frame_rate      = ceil(comp:GetPrefs("Comp.FrameFormat.Rate"))

    input           = i*frame_rate
    rand_rate       = frame_rate - input

    function increment(start_pos, destination, frame_time)
        start_pos   = start_pos or 0.5
        output      = (destination - start_pos)/frame_time
        output      = (time%rand_rate) * output
        return start_pos + output
    end

    seed            = s + 1
    rand_seed       = randomseed(floor(time/(rand_rate))+seed)
    rand            = random(0,100)*.01

    rand_seed_2     = randomseed(floor((rand_rate+time)/(rand_rate))+seed)
    rand_2          = random(0,100)*.01

    movement        = increment(rand, rand_2, rand_rate)

    return movement
end

return randPhase(gui.Offset, gui.Seed)