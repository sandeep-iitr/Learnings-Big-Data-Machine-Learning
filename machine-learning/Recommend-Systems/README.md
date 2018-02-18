# Recommendation Systems	

## Collaborative Filtering
- Based on past behavior
- Different Types:
  - User-Based
  - Item-Based
  - Model-Based
- Steps
  - Identify the neighborhood of the target user: some sort of similarity computation is needed
    - Normally we can use: Pearson-Correlation
  - Take the weighted average from the neighborhood of target user
  
  
## Model Based Collaborative Filtering

### Latent factor model
- Idea is to exploit correlation between the rows and columns of rating matrix R.
- R is approximated by product of low rank factors.
- Low rank approximation is possible even for sparse R.
- The fully specified low rank approximation provides a robust estimation of the missing entries of R.
- R = UV
  - Rows of U: user latent vectors
  - Column of V: Item latent vectors.
  - Approximate sparse R into product of low rank factors using optimization formulation of matrix factorization.
 
### Unconstrained matrix factorization
- Non-Negative Matrix Factorization: **NNMF**
- Matrix Factorization with Bias (MF with Bias)

### NNMF
- Major advantage is the high level of interpretability, it provides in understanding the user-item
interaction.

