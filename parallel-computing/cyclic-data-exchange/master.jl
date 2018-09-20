# -------------------------------
#  Cyclic data exchange example - Master
# -------------------------------

# Every worker will have a global variable "mynumber" which holds some data (a random number in this example).
# The goal is to make the workers exchange this data cyclically (forward it to the next worker).
# We will realize this exchange by multiple channels, one on each worker.
# Every worker will push his number to the next workers channel and check his own channel to receive a new number.

using Distributed

N = 4

# Create workers
addprocs(N)

# Create a channel on every worker for receiving data.
# Store RemoteChannel handles to those channels in a dictoniary pid => RemoteChannel
const channels = Dict(p=>RemoteChannel(() -> Channel{Int}(1), p) for p in workers())

# Make the dictionary a global constant on every worker process
@everywhere workers() channels=$channels # will also be a constant global on the worker processes


# Function for displaying the current data ("mynumber") distribution.
function print_numbers()
    for p in workers()
        println("$p => ", fetch(@spawnat p mynumber))
    end
end

# Will perform one cyclic exchange between the workers.
function makestep()
    # run worker script on every worker
    @everywhere workers() include("worker.jl")
    print_numbers()
end






















# # Tell every worker who his neighbor is (create global constant "npid")
# # We could use ParallelDataTransfer.jl here to make this nicer.
# w = workers()
# nw = nworkers()
# @sync for i in 1:length(w)
#     pid = w[i]
#     npid = w[mod1(i+1, nw)]
#     @spawnat pid eval(:(global const npid = $npid))
# end