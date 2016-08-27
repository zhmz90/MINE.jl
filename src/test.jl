function test()
    para = Parameter(0.6, 15.0)
    x = collect(linspace(0,1,1000))
    y = sin(10π*x) + x
    prob = Problem(x,y)
    ppara = get_pointer(para)
    pprob = get_pointer(prob)
    pscore = compute_score(pprob, ppara)
    @show pscore
    mic(pscore)
    free_score(pscore)
end

function get_pointer(obj::Parameter)
    convert(Ptr{Parameter}, pointer_from_objref(obj))
end

function get_pointer(obj::Problem)
    convert(Ptr{Problem}, pointer_from_objref(obj))
end

function get_pointer(obj::Score)
    convert(Ptr{Score}, pointer_from_objref(obj))
end
