
function compute_score(prob::Ptr{Problem}, param::Ptr{Parameter})
    @fncall(:mine_compute_score, Ptr{Score}, (Ptr{Problem},Ptr{Parameter}), prob, param)
end

function check_parameter(param::Ptr{Parameter})
    @fncall(:mine_check_parameter, Ptr{Cchar}, (Ptr{Parameter},), param)
end

function mch(pscore::Ptr{Score}, eps::Cdouble)
    @fncall(:mine_mch, Cdouble, (Ptr{Score}, Cdouble), pscore, eps)
end

for fn in (:mic,:mas,:mev,:mch_general)
    @eval quote
        function $fn(score::Ptr{Score})
            @fncall($fn, Cdouble, (Ptr{Score},), score)
        end
    end
end

function free_score(score::Ptr{Score})
    @fncall(:mine_free_score, Cdouble, (Ptr{Score},), score)
end


