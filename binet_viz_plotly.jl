
using Plotly

const ϕ = (1 + √5) / 2

function binet(n)
    f = Complex(ϕ)
    r = (f^n - (-f)^-n) / √5
    return r
end

function binet_viz(n, step=0.02)
    ns = -n:step:n

    fibs = binet.(ns)

    res = real(fibs)
    ims = imag(fibs)

    re_max = maximum(res)
    im_max = maximum(ims)
    max_max = max(re_max, im_max) * 1.1

    Plot(scatter3d(x=ns, y=res, z=ims))
end

bv = binet_viz(3)

Plotly.signin("EarthGoddessDude", "ETZ3nfynBbHWUptxcXZN")

Plotly.set_credentials_file(
    Dict(
        "username" => "EarthGoddessDude",
        "api_key" => "ETZ3nfynBbHWUptxcXZN"
    )
)

post(bv)
