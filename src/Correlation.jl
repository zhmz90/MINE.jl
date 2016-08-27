module Correlation

include("wrapper/CAPI.jl")
import .CAPI: Problem, Parameter, Score

include("mine.jl")
include("utils.jl")

end
