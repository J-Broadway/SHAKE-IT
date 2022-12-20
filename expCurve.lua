:
function expCurve(slope, x)
    slope = slope or 100
    y = (slope^x -1)/(slope-1)
    return y
end

return(expCurve(50, dev.a))