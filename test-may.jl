using GLMakie
using Bonito

x0=0.01
fig=Figure()
ax=Axis(fig[1,1])
slr=GLMakie.SliderGrid(fig[2, 1],
    (label="r",range = 0.00:0.05:4.05, startvalue = 2.0))
r_obs=[sl.value for sl in slr.sliders][1]
pts = lift(r_obs) do r
    empty!(ax)
    f(x)=r*x*(1-x)
    xs1=[x0]
    for t ∈ range(1,500,length=500)
        x1=f(last(xs1))
        push!(xs1,x1)
    end
    GLMakie.scatter!(xs1)
end
fig