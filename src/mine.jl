#=
how to compute mic with two variable
x = linespace(0,1,10) |> Array
y = sin(x)
f = MINE(method=:mic, alpha=0.6, c=15)
# formula = MINE(method=[:mic,:mas], alpha=0.6, c=15)
s = f(x, y)
=#

function MINE(fn::Symbol=:mic;
              alpha::Float64=0.6, c::Float64=15.0)
    
    @assert 0 <= alpha <= 1
    @assert c > 0
    return score = problem_score(alpha, c)
    @show score
#    return (x,y)-> (score(x,y) |> eval(CAPI, fn))
    return (x,y)-> (score(x,y) |> CAPI.mic)
end

function MINE(fns::Array{Symbol,1}=[:mic];
              alpha::Float64=0.6, c::Float64=15.0)
    
    @assert 0 <= alpha <= 1
    @assert c > 0
    
    (x,y) -> map(fn->MINE(fn, alpha=alpha, c=c)(x, y), fns)
end

function problem_score(alpha, c)
    param  = Parameter(alpha, c)
    pparam = convert(Ptr{Parameter}, pointer_from_objref(param))
    
    function problem_score(x::Array{Float64,1}, y::Array{Float64,1})
        prob  = Problem(x, y)
        pprob = convert(Ptr{Problem}, pointer_from_objref(prob))
        CAPI.compute_score(pprob, pparam)
    end
end

function unsafe_load_score(pscore::Ptr{Score})
    pscore
end

function main()
    f = MINE(:mic)
    f([1,2.0], [2.0, 4])
end
