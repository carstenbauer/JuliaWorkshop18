function myfunction(n)
    for i = 1:n
        A = randn(100,100,20)
        m = maximum(A)
        Am = mapslices(sum, A; dims=2)
        B = A[:,:,5]
        Bsort = mapslices(sort, B; dims=1)
        b = rand(100)
        C = B.*b
    end
end


# # Do the following in the Juno IDE
# using Profile
# Profile.clear()
# myfunction(1) # trigger compilation
# @profile myfunction(10)
# # up to here, everything is the same as for using ProfileView.jl

# # Now comes the cool part. Visualize your profile results:
# Juno.profiler()
# # or simply
# @profiler myfunction(10)
