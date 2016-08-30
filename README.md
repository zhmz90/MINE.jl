# MINE
[![Build Status](https://travis-ci.org/zhmz90/MINE.jl.svg?branch=master)](https://travis-ci.org/zhmz90/MINE.jl)

**THIS PACKAGE IS NOT READY TO USE!**

This package is a Julia wrapper of [minepy](https://sourceforge.net/projects/minepy/files/)'s C library for Maximal Information-based Nonparametric Exploration (MIC and MINE family).
There are also other language wrappers avaiable in [Python](http://minepy.sourceforge.net/docs/1.0.0/index.html), [R](http://minepy.sourceforge.net/docs/1.0.0/index.html), [Matlab/Octave](http://minepy.sourceforge.net/docs/1.0.0/index.html) and [C++](http://minepy.sourceforge.net/docs/1.0.0/index.html).

### Installation
	Pkg.clone("https://github.com/zhmz90/MINE.jl.git")
	
### Usage
```Julia
	using MINE
	
	x = rand(3)
	y = rand(3)
	mine = MINE(x,y)
	compute_stats!(mine)
	stats = mine.stats
```

### APIs
```Julia
    function compute_stats!(mine::MINE)
	function compute_mic!(mine::MINE)
	function compute_mas!(mine::MINE)
	function compute_mev!(mine::MINE)
	function compute_mch!(mine::MINE)
	function compute_mch_general!(mine::MINE)	
```

### References
- [minepy](http://minepy.sourceforge.net/docs/1.0.0/index.html#)
- [MINE](http://www.exploredata.net)

