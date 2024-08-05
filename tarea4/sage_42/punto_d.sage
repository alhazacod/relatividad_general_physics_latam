M = Manifold(4, 'M', latex_name=r'\mathscr{M}', structure='Lorentzian')
X.<v,r,th,ph> = M.chart(r"v r:(0,+oo) th:(0,pi):\theta ph:(0,2*pi):\varphi:periodic")

m = var('m')
assume(m>=0)

Q = var('Q')
assume(abs(Q)<m)

fr = 1 - 2*m/r + Q^2/r^2

g = M.metric()

g[0,0] = -fr
g[0,1] = 2
g[2,2] = r^2
g[3,3] = r^2*sin(th)^2

print(g.display())

########### Vector de Killing ###############
v = M.vector_field(1,0,0,0, name='v') # Vector de Killing  \frac{\partial}{\partial v}
print(f'L_\\xi(g) = {g.lie_der(v).display()}')
