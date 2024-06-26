M = FiniteRankFreeModule(QQ, 4, name = 'M')
e = M.basis('e')
x = M.tensor((2,0), name='x')
x[:] = [[2,0,1,-1], [-1,0,3,2], [-1,1,0,0], [-2,1,1,-2]]
g = M.tensor((0,2), name='g')
g[:] = [[-1,0,0,0], [0,1,0,0], [0,0,1,0],[0,0,0,1]]
v = M.tensor((1,0), name='v')
v[:]=[-1,2,0,-2]

print('X^mu_nu')
print((g['_ln']*x['^mn'])[:])

print('X_mu^nu')
print((g['_ml']*x['^ln'])[:])

print('X^(mu nu)')
print((1/2*(x['^mn'] + x['^nm']))[:])

print('X_[mu nu]')
xabajo1 = g['_ln']*x['^mn']
xabajo = g['_lm']*xabajo1['^m_n']
print((1/2*(xabajo['_mn'] - xabajo['_nm']))[:])

print('X^l_l')
print(g['_al']*x['^la'])

print('V^mu V_mu')
vabajo = g['_ml']*v['^m']
print(v['^m']*vabajo['_m'])

print('V_mu X^mu nu')
print((vabajo['_m']*x['^mn'])[:])
