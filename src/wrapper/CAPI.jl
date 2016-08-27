module CAPI

const libmine = joinpath(dirname(dirname(@__FILE__)), joinpath("c",
                        @static if is_linux() "libmine.so"
                                elseif is_osx() "limine.dylab"
                                else error("this package only support osx and linux")
                                end))
function __init__()
    println(libmine)
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
include("function.jl")

end
