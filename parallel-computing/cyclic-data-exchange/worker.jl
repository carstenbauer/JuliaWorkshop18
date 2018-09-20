# -------------------------------
#  Cyclic data exchange example - Worker
# -------------------------------

# find pid of next worker
sworkers = sort(workers())
idx = findfirst(isequal(myid()), sworkers)+1
npid = sworkers[mod1(idx, nworkers())] # cyclic

# get npid's channel
nch = channels[npid]
mych = channels[myid()]

# receive or generate random number
if isready(mych)
    global mynumber = take!(mych)
    # println("Received $mynumber.")
else
    global mynumber = rand(1:10)
    # println("My number is ", mynumber)
end

# push mynumber to neighboring worker
put!(nch, mynumber)
# println("Pushed $mynumber to worker $npid.")