

# This file was *autogenerated* from the file punto5.sage
from sage.all_cmdline import *   # import sage library

_sage_const_4 = Integer(4); _sage_const_2 = Integer(2); _sage_const_0 = Integer(0); _sage_const_1 = Integer(1); _sage_const_3 = Integer(3)
M = FiniteRankFreeModule(QQ, _sage_const_4 , name = 'M')
e = M.basis('e')
x = M.tensor((_sage_const_2 ,_sage_const_0 ), name='x')
x[:] = [[_sage_const_2 ,_sage_const_0 ,_sage_const_1 ,-_sage_const_1 ], [-_sage_const_1 ,_sage_const_0 ,_sage_const_3 ,_sage_const_2 ], [-_sage_const_1 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ], [-_sage_const_2 ,_sage_const_1 ,_sage_const_1 ,-_sage_const_2 ]]
g = M.tensor((_sage_const_0 ,_sage_const_2 ), name='g')
g[:] = [[-_sage_const_1 ,_sage_const_0 ,_sage_const_0 ,_sage_const_0 ], [_sage_const_0 ,_sage_const_1 ,_sage_const_0 ,_sage_const_0 ], [_sage_const_0 ,_sage_const_0 ,_sage_const_1 ,_sage_const_0 ],[_sage_const_0 ,_sage_const_0 ,_sage_const_0 ,_sage_const_1 ]]
v = M.tensor((_sage_const_1 ,_sage_const_0 ), name='v')
v[:]=[-_sage_const_1 ,_sage_const_2 ,_sage_const_0 ,-_sage_const_2 ]

print('X^mu_nu')
print((g['_ln']*x['^mn'])[:])

print('X_mu^nu')
print((g['_ml']*x['^ln'])[:])

print('X^(mu nu)')
print((_sage_const_1 /_sage_const_2 *(x['^mn'] + x['^nm']))[:])

print('X_[mu nu]')
xabajo1 = g['_ln']*x['^mn']
xabajo = g['_lm']*xabajo1['^m_n']
print((_sage_const_1 /_sage_const_2 *(xabajo['_mn'] - xabajo['_nm']))[:])

print('X^l_l')
print(g['_al']*x['^la'])

print('V^mu V_mu')
vabajo = g['_ml']*v['^m']
print(v['^m']*vabajo['_m'])

print('V_mu X^mu nu')
print((vabajo['_m']*x['^mn'])[:])
