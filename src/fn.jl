
function compute_score(prob::Ptr{Problem}, param::Ptr{Parameter})
    @fncall(:mine_compute_score, Ptr{Score}, (Ptr{Problem},Ptr{Parameter}), prob, param)
end

function check_parameter(param::Ptr{Parameter})
    @fncall(:mine_check_parameter, Ptr{Cchar}, (Ptr{Parameter},), param)
end

for fn in (:mic,:mas,:mev,:mch,:mch_general)
    eval(quote
         function $fn(score::Ptr{Score})
             @fncall($fn, Cdouble, (Ptr{Score},), score)
         end
         end)
end

function free_score(score::Ptr{Score})
    @fncall(:mine_free_score, Cdouble, (Ptr{Score},), score)
end

#=
function mic(score::Ptr{Score})
    @fncall(:mine_mic, Cdouble, (Ptr{Score},), score)
end

function mas(score::Ptr{Score})
    @fncall(:mine_mas, Cdouble, (Ptr{Score},), score)
end

function mev(score::Ptr{Score})
    @fncall(:mine_mev, Cdouble, (Ptr{Score},), score)
end

function mch(score::Ptr{Score})
    @fncall(:mine_mch, Cdouble, (Ptr{Score},), score)
end

function mch_general(score::Ptr{Score})
    @fncall(:mine_mch_general, Cdouble, (Ptr{Score},), score)
end
=#


