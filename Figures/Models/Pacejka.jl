using PyPlot

function pacejka(a,D,C,B)
    #B = 10.0             # This value determines the steepness of the curve
    #C = 1.25
    mu = 0.8            # Friction coefficient (responsible for maximum lateral tire force)
    m = 1000            # 1000 kg
    g = 9.81
    #D = mu * m * g/2
    C_alpha_f = mu*m*g/2*D*sin(C*atan(B*a))
    return C_alpha_f
end

function main()
    a = -0.5:.01:0.5
    plot(a/pi*180,pacejka(a,1,1.9,10))
    plot(a/pi*180,pacejka(a,0.3,2,5))
    grid("on")
    xlabel("Slip angle [deg]")
    ylabel("Tire force [N]")
    legend(["Dry road","Snow"])
    tight_layout()
end

function initPlot()
    linewidth = 0.5
    rc("axes", linewidth=linewidth)
    rc("lines", linewidth=linewidth, markersize=2)
    #rc("font", family="")
    rc("axes", titlesize="small", labelsize="small")        # can be set in Latex
    rc("xtick", labelsize="x-small")
    rc("xtick.major", width=linewidth/2)
    rc("ytick", labelsize="x-small")
    rc("ytick.major", width=linewidth/2)
    rc("text", usetex="true")
    rc("legend", fontsize="small")
    rc("font",family="serif")
    rc("font",size=10)
    rc("figure",figsize=[4.5,3])
    #rc("text.latex", preamble = """\\usepackage[utf8x]{inputenc}\\usepackage[T1]{fontenc}\\usepackage{lmodern}""")               # <- tricky! -- gotta actually tell tex to use!
    #rc("pgf", texsystem="pdflatex",preamble=L"""\usepackage[utf8x]{inputenc}\usepackage[T1]{fontenc}\usepackage{lmodern}""")
end