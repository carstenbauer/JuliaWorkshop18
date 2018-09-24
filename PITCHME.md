![](https://raw.githubusercontent.com/JuliaGraphics/julia-logo-graphics/master/images/three-balls.svg?sanitize=true) <!-- .element height="10%" width="10%" -->

# Julia

A new interpreted programming language *specifically* made for scientists and engineers


Note: ~5 years ago at MIT


----

## Compiled

* `C`, `Java`, `Fortran`, `Go`, `Haskell`, `Rust`
* Once compiled, saved in native code as an executable
* **Static**: you can't change anything once compiled
* **Fast**: because more things are known about the program's constructs
* Industry standard

Note: Two main types of languages: Compiled and interpreted

----

## Interpreted

* `MATLAB`, `Python`, `R`, `Mathematica`, `JavaScript`, `Julia`
* **Dynamic**: write → (interpretation-layers) → run
* Easy to code
* **Slow**: Not so much can be optimized about the program because less is known
* Most relevant for scientific work

Note: interpreted language is best suited for back and forth coding, test, look, repeat.


---

# Two-language problem

Note: R, Python, and MATLAB are coded mostly in C/++. Anything that is fast in those languages is coded in C/++.

----

## Building good programs

1. Brain-storm in an interpreted language for algorithm exploration and testing.
2. Deliver a performant final-version in a compiled language.

Note: Most compiled programs had a testing stage in an interpreted language, and most influential interpreted programs will have a compiled version.

----

## Using interpreted languages

```none
Does a package/library do exactly
what you need?
             ├── Yes:   Great!
             ├── Dunno: You need to read C/++ code.
             └── No:    You need to code in C/++.
```

Note: for users of an interpreted language and its libraries.

----

## What if the interpreted language is fast enough?

* [Benchmarks](https://julialang.org/benchmarks/)
* Solves the two-language problem
* `Julia` is mostly coded in `Julia`!

Note: Julia is mostly coded in Julia!

----

## LOC versus speed

![](https://raw.githubusercontent.com/johnfgibson/whyjulia/8b7617de701a25387e40dc00ee20ad99f4695c47/figs/ks_cpu_vs_lines_1024.png)

Note: 
1. I wrote a flexible and fast ray tracer in Julia. It's 100 LOC. 
2. The study "Mash: fast genome and metagenome distance estimation using MinHash" used MinHashing -- a fast algorithm for comparing two sets of things -- for DNA sequence comparison. They implemented it in C for speed. Someone else made python bindings to the compiled C version. But someone implemented it directly in Julia and made it super fast in under 100 lines of very readable code.


---

# Dynamic & fast, how?

1. Just-in-time compilation (JIT): User-level code is compiled to machine code on-the-fly.
2. Meticulous type system: Designed to maximize impact of JIT.
3. Multiple dispatch: Function dispatch determined at compile time when possible, run time when not.

Note: JIT compilation times are slow for first run


---

# Easy code
Looks like `Python`/`MATLAB`/`R` but with prettier syntax.


----

## Syntax

<section style="text-align: left;">
Math:
```julia
2π√3/5α₀
```
`Python`:
```python
2*np.pi*np.sqrt(3)/(5*alpha0)
```
`Julia`:
```julia
2π*√3/5α₀
```

Note: which one is closer to the mathematical formulation?

----

## Custom infix operators

```julia
# rotate coordinate `c` by `θ` radians
julia> ↺(c, θ) = [cos(θ) -sin(θ); sin(θ) cos(θ)]*c
↺ (generic function with 1 method)

julia> [1,0] ↺ π/2
2-element Array{Float64,1}:
 0.0
 1.0   
```

Note: This opens the door to tons of cool syntax.

----

## Embedded units

It took a beetle 36 seconds to walk 25 cm. How many days will it take it to walk 3 km?

```julia
using Unitful:uconvert, cm, km, s, d
v = 25cm/36s
t = 3km/v
uconvert(d, t)
```
5 days

Note: Unicode characters, degree symbol, Greek letters, square root, units. Easy to read and understand, scientists are not programmers.


---

# Missing

The concept of `missing` and `NaN` is treated correctly:
```julia
julia> NaN + 1         = NaN

julia> missing + 1     = missing

julia> true | missing  = true

julia> false | missing = missing

julia> true & missing  = missing

julia> false & missing = false
```

Note: Consider that no other language has managed to get this concept of missing data correctly into their code.


---

# Zero overhead

Full access to all the libraries and functionalities you already know.

`PyCall.jl`, `JavaCall.jl`, `RCall.jl`, `CCall.jl`, `Mathematica.jl`, and `MATLAB.jl`

Note: you can call Julia home without losing all of your furniture in the move.


---

# Some of my favourite things

* [AxisArrays](https://github.com/JuliaArrays/AxisArrays.jl): Arrays where each dimension can have a named axis with ranged values.
* [Images](https://github.com/JuliaImages/Images.jl) & [Colors](https://github.com/JuliaGraphics/Colors.jl): Treat colors as a unit rather than 1/3/4 numbers.
* [Unitful](https://github.com/ajkeller34/Unitful.jl): Units for free!


Note: Many many more, but it's outside the scope of this presentation

---

# Free & open source

* Easy to share and collaborate with *anyone*
* Drives the language forward
* Highly specialized and niche solutions and tools
* Free from hardware requirements
* No "black boxes", everything is within reach


Note: This is true for Python and R, but not MATLAB. Julia got git integration really well.

---

# Disadvantages
Mostly it's just too new…

Note: nothing is perfect. 

----

## Too new!

* Ecosystems (e.g. packages, IDEs, debugger) not as mature as in other environments.
* Some of the more specialized libraries are missing.
* Harder to Google for answers.

Note: IDE (Integrated Development Environment). Maybe in 6 months or so the environment will solidify completely.

----

## Still working out all the kinks 

* Loading some packages is still a bit slow.
* Plotting works but hasn't settled yet.
* Transitioning into `v1.0.0`: Major changes.

----

## General purpose

* Need statistics? `R`
* Need vectorized operations on matrices? `MATLAB`
* `Julia` (like `Python`) is more general-purpose → can be harder to find what you're looking for.

Note: apropos statistics, Douglas Bates, the developer of the `lme4` R package for GLMMs switched to Julia.

---

# Conclusions

* `Julia` is considered by many one of the best interpreted languages out there.
* A number of libraries already far out-perform their equivalents in other languages.
* People come to `Julia` because of its speed, but stay for the type-dispatch system ♥ 
* Suffers from being "too new": might not be suitable for early adopters.

Note: I've started using Julia about 4 years ago and never looked back.


---

<!-- .slide: data-background-color="#ffffff" -->

![](https://raw.githubusercontent.com/JuliaGraphics/julia-logo-graphics/master/images/julia-logo.svg?sanitize=true) <!-- .element height="100%" width="100%" -->
