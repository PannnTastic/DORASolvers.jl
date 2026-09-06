"""
DORASolvers.jl. Dijkstra Oracle Reduced-cost Algorithm for online stochastic shortest
path navigation, packaged as a solver for models formulated with POMDPs.jl.

Quick start:

    using DORASolvers, POMDPs, POMDPModels
    planner = solve(DORASolver(), SimpleGridWorld())
    a = action(planner, GWPos(1, 1))

See the `examples/` directory for worked examples and the online
documentation at https://ai-vnv.github.io/DORASolvers.jl/dev/.

If you use this package, please cite the paper it implements: Mansur M. Arief,
Ali Akarma, Ahmad Alfan Alfian Irfan, "Dijkstra as an Oracle for Online
Stochastic Shortest Path Navigation with Provable Guarantees",
arXiv:2608.17703, 2026. https://arxiv.org/abs/2608.17703
"""
module DORASolvers

include("RNG.jl")
include("Dijkstra.jl")
include("NavSSP.jl")
include("TabularSSP.jl")
include("Learners.jl")

using .RNGs
using .Dijkstra
using .NavSSPs
using .TabularSSPs
using .Learners

include("solver.jl")

export SplitMix64, rand01, randint, uniform, categorical
export ReverseAdj, dijkstra_policy, dijkstra_to_goal, reset_ops!, edge_scans
export NavSSP, build, eval_policy, optimal_value, outcome_rates,
       causality_margin, reduced_costs, NACT, MAXOUT
export TabularSSP, tabularize, TabularSSPs
export DORALearner, DORA0, CED, EGD, OptimisticVI, RiskDORA, Sarsa, MCTSPlan,
       plan!, observe!, run_episode!, update_multiplier!, work,
       oracle_calls, vi_sweeps, rhat
export DORASolver, DORAPlanner, replan!, train!

end # module
