
function compute_score(prob::Ptr{Problem}, param::Ptr{Parameter})
    @fncall(:mine_compute_score, Ptr{Score}, (Ptr{Problem},Ptr{Parameter}), prob, param)
end

function check_parameter(param::Ptr{Parameter})
    @fncall(:mine_check_parameter, Ptr{Cchar}, (Ptr{Parameter},), param)
end

function mch(pscore::Ptr{Score}, eps::Cdouble)
    @fncall(:mine_mch, Cdouble, (Ptr{Score}, Cdouble), pscore, eps)
end

#=
for func in (:mic,:mas,:mev,:mch_general)
    @eval quote
        function func(score::Ptr{Score})
            @fncall(symbol("mine_", $func), Cdouble, (Ptr{Score},), score)
        end
    end
end
=#

for func in (:mic, :mas, :mev, :mch_general)
    @eval begin
        function $func(score::Ptr{Score})
            ccall((symbol("mine_", $func), $libmine), Cdouble, (Ptr{Score},), score)
        end
    end
end

function free_score(score::Ptr{Score})
    @fncall(:mine_free_score, Cdouble, (Ptr{Score},), score)
end


