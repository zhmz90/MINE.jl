#mic+mas+mev+mch <- score <- param + problem

function compute_score!(mine::MINE)
    ppara = pointer_from_objref(mine.para)
    pprobm = pointer_from_objref(mine.probm)
    pscore = compute_score(pprobm, ppara)
    mine.score = unsafe_load(pscore)
end

for func in [:mic, :mas, :mev, :mch, :mch_general]
    @eval quote
        function $func(pscore::Ptr{Score})
            ccall((:string("mine_",$func), $libmine),Float64,(Ptr{Score},), pscore)
        end
    end)
end




