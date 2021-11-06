
using CairoMakie

const ϕ = (1 + √5) / 2

function binet(n)
    f = Complex(ϕ)
    r = (f^n - (-f)^-n) / √5
    return r
end


p = begin
    n = 3
    step=0.02
    ns = -n:step:n

    fibs = binet.(Complex.(ns))

    res = real(fibs)
    ims = imag(fibs)

    # re_max = maximum(res)
    # im_max = maximum(ims)
    # max_max = max(re_max, im_max) * 1.1

    meshscatter(ns, res, ims, markersize=0.05, color=res)
    # meshscatter(.5 .* ns, res, ims, markersize=0.05, color=res)
    # meshscatter!(-ns .- 6, res, -ims, markersize=0.05, color=res)
    # meshscatter!(ns, -res .+ 4, ims, markersize=0.05, color=res)
    # meshscatter!(-.5 .* ns .-3, -res .+ 4, -ims, markersize=0.05, color=res)
    current_figure()
end

p

