# Definir la variedad
M = Manifold(4, 'R^4', start_index=1)
# Definir las coordenadas
c_spher.<t,r,th,ph> = M.chart(r't:(0,+oo) r:(0,+oo) th:(0,pi):\theta ph:(0,2*pi):\phi')
# Definir la función a(t)
f = function('f')(r)

# Definir la métrica g de FRW
g = M.metric('g')
g[1,1] = -f
g[2,2] = 1/f
g[3,3] = r^2
g[4,4] = r^2 * sin(th)^2

# Inversa de la métrica
ginv = g.inverse()

'''
# Calcular las derivadas parciales \partial_\mu g_{\nu\sigma}
partial_g = [[[[None for _ in range(4)] for _ in range(4)] for _ in range(4)] for _ in range(4)]

for mu in range(4):
    for nu in range(4):
        for sigma in range(4):
            partial_g[mu][nu][sigma] = g[nu+1, sigma+1].diff(c_spher[mu+1])

# Calcular los símbolos de Christoffel \Gamma^\lambda_{\mu\nu}
Gamma = [[[None for _ in range(4)] for _ in range(4)] for _ in range(4)]

for lam in range(4):
    for mu in range(4):
        for nu in range(4):
            Gamma[lam][mu][nu] = sum(
                ginv[lam+1, sigma+1] * (partial_g[mu][nu][sigma] + partial_g[nu][mu][sigma] - partial_g[sigma][mu][nu])
                for sigma in range(4)
            ) / 2

# Mostrar los símbolos de Christoffel diferentes de 0
for lam in range(4):
    for mu in range(4):
        for nu in range(4):
            if Gamma[lam][mu][nu] != 0:
                print(f"Gamma^{lam+1}_{mu+1}{nu+1} = {Gamma[lam][mu][nu]}")

print(g.christoffel_symbols_display(chart=c_spher))
'''

#print(f'Metrica contravariante: {ginv}\n')

riem = g.riemann()
#print(riem.display_comp(c_spher.frame(), c_spher, only_nonredundant=True))

# Con la definicion de la clase 
#print('Tensor de Rieman Metodo Tarea \n')
chris_symbols = g.christoffel_symbols_display(chart=c_spher)
#print(f'Simbolos de Christoffel: {chris_symbols}\n')
#riem = nabla(chris_symbols)
#print(riem)
ricci = riem["^s_msn"]
#print(ricci.display())
#print(f'R_mn = {latex(ricci[:])}\n')
print('\nEscalar de Ricci\n')
ricciinv = ginv["^mr"]*(ginv["^ns"]*ricci["_rs"])["_r^n"]
ricci_scalar = g["_mn"]*ricciinv["^mn"]
print(f'R = {latex(ricci_scalar.display())}')
