module MINE

@linux_only const libmine = joinpath(dirname(@__FILE__), "c/libmine.so")
@osx_only const libmine = joinpath(dirname(@__FILE__), "c/libmine.dylab")

export Problem, Parameter, Score, compute_score, check_parameter, mch, mic, mas, mev, mch_general

function __init__()
    if !isfile(libmine)
        if OS_NAME != :Windows
            cd("c") do
                run(`make libmine`)
            end
        else
            error("MINE.jl current doesn't support Windows now")
        end
    end
end

macro fncall(fn, return_type)
    f = eval(fn)
    quote
        ccall(($(Meta.quot(f)), $libmine), $return_type,
              ())
    end
end

macro fncall(fn, return_type, argtypes, args...)
    f = eval(fn)
    args = map(esc, args)
    quote
        ccall(($(Meta.quot(f)), $libmine), $return_type,
              $argtypes, $(args...))
    end
end

include("type.jl")
include("fn.jl")
include("utils.jl")
#include("api.jl")
include("quick_api.jl")

end
