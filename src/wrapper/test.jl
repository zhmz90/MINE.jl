using CAPI

prob = CAPI.Problem([1,2.0], [1.0,2])
para = CAPI.Parameter(1.0,1.0)

pprob = convert(Ptr{CAPI.Problem}, pointer_from_objref(prob))
ppara = convert(Ptr{CAPI.Parameter}, pointer_from_objref(para))
CAPI.compute_score(pprob, ppara)




