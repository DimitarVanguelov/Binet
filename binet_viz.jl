
using CairoMakie

const ϕ = (1 + √5) / 2

function binet(n)
    f = Complex(ϕ)
    r = (f^n - (-f)^-n) / √5
    return r
end


let
    n = 3
    step=0.02
    ns = -n:step:n

    fibs = binet.(ns)

    res = real(fibs)
    ims = imag(fibs)

    re_max = maximum(res)
    im_max = maximum(ims)
    max_max = max(re_max, im_max) * 1.1

    lines(res, ims)
    sc = scatter!(res, ims, color=range(0, 0.5, length=length(ns)), colormap=:thermal)
    sc.colorrange = (0, .55)
    current_figure()
end

