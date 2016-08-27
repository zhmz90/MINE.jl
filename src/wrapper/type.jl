type Problem
    n::Cint
    x::Ptr{Cdouble}
    y::Ptr{Cdouble}
    
    function Problem()
        new(0,C_NULL,C_NULL)
    end
    function Problem(x::Array{Float64,1}, y::Array{Float64,1})
        n = length(x)
        px = pointer(x)
        py = pointer(y)
        new(n, px, py)
    end
end

type Parameter
    alpha::Cdouble
    c::Cdouble
    function Parameter()
        new(0.6,15)
    end
    function Parameter(alpha::Float64,c::Float64)
        new(alpha, c)
    end
end

type Score
    n::Cint
    m::Ptr{Cint}
    M::Ptr{Ptr{Cdouble}}
    function Score()
        new(0,C_NULL,C_NULL)
    end
end



