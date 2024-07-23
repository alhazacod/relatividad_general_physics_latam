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
nabla = g.connection()
ginv = g.inverse()
print(f'Metrica contravariante: {ginv}\n')

riem = g.riemann()
riem_disp = riem.display_comp(c_spher.frame(), c_spher, only_nonredundant=True)

print('Tensor de Rieman Metodo Sage \n')
print(riem_disp)
print('\n')
print(latex(riem_disp))
print('\n')


# Con la definicion de la clase 
print('Tensor de Rieman Metodo Tarea \n')
chris_symbols = g.christoffel_symbols_display(chart=c_spher)
print(f'Simbolos de Christoffel: {chris_symbols}\n')
#riem = nabla(chris_symbols)
#print(riem)
ricci = riem["^s_msn"]
#print(ricci)
print(f'R_mn = {latex(ricci[:])}\n')
print('\nEscalar de Ricci\n')
ricciinv = ginv["^mr"]*(ginv["^ns"]*ricci["_rs"])["_r^n"]
print(ricciinv)
ricci_scalar = g["_mn"]*ricciinv["^mn"]
print(f'R = {latex(ricci_scalar.display())}')


