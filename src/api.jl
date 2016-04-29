#mic+mas+mev+mch <- score <- param + problem

type MINE
    para::Parameter
    prob::Problem
    score::Score
    stats::Array{Cdouble,1}
    
    function MINE()
        para = Parameter()
        check_parameter(pointer_from_objref(para))
        #probm = Problem()
        #score = Score()
        #stats = zeros(Cdouble, 5)
        new(probm)
    end
    function MINE(;alpha::Float64, c::Float64)
        para = Parameter(alpha, c)
        check_parameter(pointer_from_objref(para))
        #probm = Problem()
        #score = Score()
        #stats = zeros(Cdouble, 5)
        new(probm)
    end
    function MINE(x::Array{Float64,1}, y::Array{Float64,1})
        para = Parameter()
        check_parameter(pointer_from_objref(para))
        probm = Problem(x, y)
        #score = Score()
        #stats = zeros(Cdouble, 5)
        new(para, probm)
    end
end

function compute_score!(mine::MINE)
    ppara = pointer_from_objref(mine.para)
    pprobm = pointer_from_objref(mine.probm)
    pscore = compute_score(pprobm, ppara)
    mine.score = unsafe_load(pscore)
end

function compute_stats!(mine::MINE)
    for (i,func) in [:mic, :mas, :mev, :mch, :mch_general]
        mine.stats[i] = eval(quote
                             $func(mine.score)
                             end)
    end
end




