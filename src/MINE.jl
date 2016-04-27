module MINE

@linux_ony const libmine = joinpath(dirname(@__FILE__), "c/libmine.so")
@osx_ony const libmine = joinpath(dirname(@__FILE__), "c/libmine.dylab")

function __init__()
    if !isfile(libmine)
        @linux_ony cd("c") do
            run(`make libmine.so`)
        end
        @osx_ony cd("c") do
            run(`make libmine.dylab`)
        end
    end
end

macro fncall(fn, return_type)
    f = eval(fn)
    quote
        ccall(($(Meta.quot(f)), $LIBHTS), $return_type,
              ())
    end
end

macro fncall(fn, return_type, argtypes, args...)
    f = eval(fn)
    args = map(esc, args)
    quote
        ccall(($(Meta.quot(f)), $LIBHTS), $return_type,
              $argtypes, $(args...))
    end
end

include("type.jl")
include("fn.jl")
include("utils.jl")
include("api.jl")

end
