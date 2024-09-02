from sympy import symbols, diff, sqrt, pi



# Define variables

r, l, z, m = symbols('r l z m', real=True, positive=True)



# Define g00 and g11

g00 = (r**(2*z) / l**(2*z)) * (1 - (m*l**2)/r**2)

g11 = -(l**2 / r**2) * (1 - (m*l**2)/r**2)**(-1)



# Compute the gravitational surface gravity κ

dg00_dr = diff(g00, r)

kappa_expr = 1/2 * sqrt(-g00 * g11) * dg00_dr



# Simplify the expression for kappa at r = r_+ (horizon)

kappa_at_horizon = kappa_expr.subs(r, sqrt(m) * l).simplify()

print(kappa_at_horizon)



# Substitute z = 3 into the kappa expression

z_value = 3

kappa_at_horizon_z3 = kappa_at_horizon.subs(z, z_value)



# Now, express m in terms of r_+ where r_+ = sqrt(m) * l, i.e., m = (r_+/l)^2

r_plus = symbols('r_plus', real=True, positive=True)

m_in_terms_of_r_plus = (r_plus / l)**2



# Substitute m into the kappa expression

kappa_r_plus_z3 = kappa_at_horizon_z3.subs(m, m_in_terms_of_r_plus)



# Now calculate the Hawking temperature T_H = kappa / (2*pi)


T_Hawking_r_plus_z3 = kappa_r_plus_z3 / (2 * pi)

print(T_Hawking_r_plus_z3.simplify())



# Define constants and variables
G3 = symbols('G3', real=True, positive=True)

# Expression for mass M in terms of r_+
M = r_plus**4 / (4 * G3 * l**4)

# Expression for entropy S_bh
S_bh = (2 * pi * r_plus) / G3

# Derivatives dM and dS_bh
dM = diff(M, r_plus)
dS_bh = diff(S_bh, r_plus)

print(dM)

print(dS_bh)

# Check the relation dM = T_Hawking * dS_bh
relation = dM - T_Hawking_r_plus_z3 * dS_bh
print(relation.simplify())
