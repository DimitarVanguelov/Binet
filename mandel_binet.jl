
# using CairoMakie
using GLMakie


function mandelbrot(x, y)
    z = c = x + y*im
    for i in 1:30
        abs(z) > 2 && return i
        z = binet(z)^2 + binet(c)
    end
    0
end

f = Figure()

ax2, hm = heatmap(f[1, 2], -3:0.005:3, -3.1:0.005:3.1, mandelbrot,
                  colormap = Reverse(:deep), axis = (title = "Mandelbrot set",))
hidedecorations!(ax2)
Colorbar(f[1, 1], hm, flipaxis = false, label = "Iterations")
