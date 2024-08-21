M = Manifold(4, 'M', latex_name=r'\mathscr{M}', structure='Lorentzian')
X.<t,r,th,ph> = M.chart(r"t r:(0,+oo) th:(0,pi):\theta ph:(0,2*pi):\varphi:periodic")

m = var('m')
assume(m>=0)

Q = var('Q')
assume(abs(Q)<m)

fr = 1 - 2*m/r + Q^2/r^2

g = M.metric()

g[0,0] = -fr
g[1,1] = 1/fr
g[2,2] = r^2
g[3,3] = r^2*sin(th)^2

print( latex(g.display()) )
print( latex((g.ricci()).display()) )
