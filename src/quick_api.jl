#mic+mas+mev+mch <- score <- param + problem

function compute_score!(mine::MINE)
    ppara = pointer_from_objref(mine.para)
    pprobm = pointer_from_objref(mine.probm)
    pscore = compute_score(pprobm, ppara)
    mine.score = unsafe_load(pscore)
end

function mch(pscore::Ptr{Score}, eps::Cdouble)
    @fncall(:mine_mch, Cdouble, (Ptr{Score}, Cdouble), pscore, eps)
end

for func in [:mic, :mas, :mev, :mch_general]
    @eval quote
        function $func(pscore::Ptr{Score})
            @fncall(string("mine_",$func),Float64,(Ptr{Score},), pscore)
        end
    end)
end




