using MINE
using Base.Test

function test()
    para = Parameter(0.6, 15)
    x = linspace(0,1,1000)
    y = sin(10π*x) +x
    prob = Problem(x,y)
    ppara = pointer(para)
    pprob = pointer(prob)
    score = compute_score(pprob, ppara)
    mic(pointer(score))
    free_score(pointer(score))
end

test()
