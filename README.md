[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/dwyl/esta/issues)

# DISTFUN-MATLAB: A collection of distance metrics for data clustering algorithms
A collection of distance metrics for data clustering algorithms.

## Definitions
- A dataset is denoted by $X^{n \times m}$ where $n$ is number of data points (rows) and $m$ is number of features (columns).
- A data point is denoted by $x_i \in \mathbb{R}^m$ where each $x$ is a vector of $m$ features.
- A distance metric $d: \mathbb{R}^m \times \mathbb{R}^m \rightarrow \mathbb{R}_+ \cup \{0\}$ is a function that quantifies degree of separation (distance) between pair of data points.
- A similarity metric $s: x_i \times x_j \rightarrow \mathbb{R}$ is a function that quantifies degree of likeness (similarity) between pair of data points.
- The distance matrix $D$ is an $n \times n$ matrix where each entry $D_{ij}$ represents distance between data points $x_i$ and $x_j$. For all data points, $D_{ij} = [x_{ij}]\in \mathbb{R}^{n \times n}$ represents a symmetric matrix of distances.

For any distance metric, the following conditions must be satisfied for any three data points $x_i, x_j, x_k$ [1, 2].
- (1) $d(x_i, x_j) = 0 \Leftrightarrow x_i = x_j \quad \text{[Identity]}$
- (2) $d(x_i, x_j) = d(x_j, x_i) \quad \text{[Symmetry]}$
- (3) $d(x_i, x_j) \leq d(x_i, x_k) + d(x_k, x_j) \quad \text{[Triangle inequality]}$

## Distance metrics included in repository
    euclidean   - Euclidean distance.
	sqeuclidean	- Squared Euclidean distance. (Does not satisfy the triangle inequality.)
    cityblock   - City block distance.
    chebyshev   - Chebyshev distance.
    canberra    - Canberra distance.
    cosine      - Cosine distance. (Does not satisfy triangle inequality.)
    cosine      - Square root cosine distance.
    corr        - Correlation distance.
    clark       - Clark distance.
    soergel     - Soergel distance.
    hamming     - Hamming distance.
    jaccard     - Jaccard distance.
    dice        - Dice distance.

- Euclidean distance: $d(x_i,x_j) = \sqrt{\sum_{k=1}^m (x_{ik} - x_{jk})^2}$
- City block distance: $d(x_i,x_j) = \sum_{k=1}^{m} |x_{ik} - x_{jk}|$
- Chebyshev distance: $ d(x_i,x_j) = \max_{k=1}^{m} |x_{ik} - x_{jk}|$
- Canberra distance: $d(x_i,x_j) = \sum_{k=1}^{m} \frac{|x_{ik} - x_{jk}|}{|x_{ik}| + |x_{jk}|}$
- Cosine distance: $d(x_i,x_j) = 1 - \frac{x_i \cdot x_j}{\|x_i\| \|x_j\|} = 1 - \left[ \frac{\sum_{k=1}^m x_{ik} x_{jk}}{\sqrt{\sum_{k=1}^m x_{ik}^2} \sqrt{\sum_{k=1}^m x_{jk}^2}} \right]$
- Correlation distance: $d(x_i,x_j) = 1 - \left[ \frac{\sum_{k=1}^{m} (x_{ik} - \bar{x}_i)(x_{jk} - \bar{x}_j)}{\sqrt{\sum_{k=1}^{m} (x_{ik} - \bar{x}_i)^2} \sqrt{\sum_{k=1}^{m} (x_{jk} - \bar{x}_j)^2}} \right]$
- Clark distance: $d(x_i,x_j) = \sqrt{\sum_{k=1}^{m} \left(\frac{|x_{ik} - x_{jk}|}{x_{ik} + x_{jk}}\right)^2}$
- Soergel distance: $d(x_i,x_j) = \frac{\sum_{k=1}^{m} |x_{ik} - x_{jk}|}{\sum_{k=1}^{m} \max(x_{ik},x_{jk})}$
- Hamming distance: $d(x_i,x_j) = \sum_{k=1}^m \mathbb{I}(x_{ik} \neq x_{jk})$
- Jaccard distance: $d(x_i,x_j) = 1 - \frac{|x_i \cap x_j|}{|x_i \cup x_j|} = 1 - \frac{\sum_{k=1}^{m} x_{ik} \cdot x_{jk}}{\sum_{k=1}^{m} (x_{ik} + x_{jk}) - \sum_{k=1}^{m} x_{ik} \cdot x_{jk}}$
- Dice distance: $d(x_i,x_j) = 1 - \frac{2|x_i \cap x_j|}{|x_i| + |x_j|} = 1 - \left[ \frac{2 \cdot \sum_{k=1}^{m} x_{ik} \cdot x_{jk}}{\sum_{k=1}^{m} x_{ik} + \sum_{k=1}^{m} x_{jk}} \right]$

## References
1. [Scitovski, R., Sabo, K., Martínez-Álvarez, F., & Ungar, Š. (2021). Cluster analysis and applications (2021st ed.). Cham, Switzerland: Springer Nature.](https://link.springer.com/book/10.1007/978-3-030-74552-3)
2. [Wierzchon, S. T., & Klopotek, M. (2018). Modern Algorithms of Cluster Analysis (1st ed.). Cham, Switzerland: Springer International Publishing.](https://link.springer.com/book/10.1007/978-3-319-69308-8)