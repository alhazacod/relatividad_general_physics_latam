g = matrix(QQ, [[-1, 0, 0, 0],
                [ 0, 1, 0, 0],
                [ 0, 0, 1, 0],
                [ 0, 0, 0, 1]])

# Define the tensor X^μ_ν
X = matrix(QQ, [[2, 0, 1, -1],
                [-1, 0, 3, 2],
                [-1, 1, 0, 0],
                [-2, 1, 1, -2]])

# Define the vector V^μ
V = vector(QQ, [-1, 2, 0, -2])

# (a) Compute X^μ_ν
X_mu_nu = X

# (b) Compute X_μ^ν (transpose of X^μ_ν)
X_nu_mu = X.transpose()

# (c) Compute X_(μν) (symmetrized tensor)
X_sym = (X + X.transpose()) / 2

# (d) Compute X_[μν] (antisymmetrized tensor)
X_antisym = (X - X.transpose()) / 2

# (e) Compute X^λ_λ (trace of the tensor)
trace_X = X.trace()

# (f) Compute V^μ V_μ (dot product of V with itself)
V_dot_product = V * V

# (g) Compute V_μ X^μν (contraction of V with the tensor X)
V_mu_X_munu = V * X

# Output the results
print("X^μ_ν:")
print(latex(X_mu_nu))
print("\nX_μ^ν:")
print(latex(X_nu_mu))
print("\nX_(μν):")
print(latex(X_sym))
print("\nX_[μν]:")
print(latex(X_antisym))
print("\nX^λ_λ:")
print(latex(trace_X))
print("\nV^μ V_μ:")
print(latex(V_dot_product))
print("\nV_μ X^μν:")
print(latex(V_mu_X_munu))

