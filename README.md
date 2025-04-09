[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/dwyl/esta/issues)

# Distance Metrics Toolkit (DISTFUN-MATLAB): Distance metric functions for numerical and categorical data dissimilarity
This repository contains MATLAB functions designed to construct dissimilarity matrices using a variety of distance metric functions. It provides a comprehensive toolkit for analyzing and comparing data sets through different distance measures.
`compdist(X,dname)` function returns $n \times n$ dissimilarity matrix.

## Definitions
- A dataset is denoted by $\mathfrak{X}^{n \times m}$ where $n$ is number of data points (rows) and $m$ is number of features (columns).
- A data point is denoted by $x_i \in \mathbb{R}^m$ where each $x$ is a vector of $m$ features.
- A distance metric $d: \mathbb{R}^m \times \mathbb{R}^m \rightarrow \mathbb{R}_+ \cup \{0\}$ is a function that quantifies degree of separation (distance) between pair of data points.
- A similarity metric $s: x_i \times x_j \rightarrow \mathbb{R}$ is a function that quantifies degree of likeness (similarity) between pair of data points.
- The distance matrix $D$ is an $n \times n$ matrix where each entry $D_{ij}$ represents distance between data points $x_i$ and $x_j$. For all data points, $D_{ij} = [x_{ij}]\in \mathbb{R}^{n \times n}$ represents a symmetric matrix of distances.

For any distance metric, the following conditions must be satisfied for any three data points $x_i, x_j, x_k$ [6][7].
- Identity: $d(x_i, x_j) = 0 \Leftrightarrow x_i = x_j$
- Symmetry: $d(x_i, x_j) = d(x_j, x_i)$
- Triangle inequality: $d(x_i, x_j) \leq d(x_i, x_k) + d(x_k, x_j)$

## Usage
**For numerical dataset.**
```m
X = readmatrix('fisheriris.csv');
dname = 'euclidean'; % Choose distance name
D = compdist(X, dname);
disp(D);
```
**For categorical dataset.**
```m
T = readtable('sample.csv', VariableNamingRule='preserve');
X = T{:,:}; % Convert table to array
dname = 'hamming'; % Choose distance name
D = compdist(X, dname);
disp(D);
```

## Distance metrics included in repository
    euclidean	- Euclidean distance.
	sqeuclidean - Squared Euclidean distance. (Does not satisfy triangle inequality.)
    cityblock	- City block distance.
    chebyshev	- Chebyshev distance.
    canberra	- Canberra distance.
    cosine		- Cosine distance. (Does not satisfy triangle inequality.)
    corr		- Correlation distance.
    clark		- Clark distance.
    soergel		- Soergel distance.
    hamming		- Hamming distance.
    jaccard		- Jaccard distance.
    dice		- Dice distance.

### Distance metric formulas
- $\text{Euclidean distance: }d(x_i,x_j) = \Vert x_i - x_j\Vert_2 =  \sqrt{\sum_{k=1}^m (x_{ik} - x_{jk})^2}$

- $\text{Squared Euclidean distance: }d(x_i,x_j) = \sum_{k=1}^m (x_{ik} - x_{jk})^2$

- $\text{City block distance: }d(x_i,x_j) = \Vert x_i - x_j\Vert_1 =  \sum_{k=1}^m |x_{ik} - x_{jk}|$

- $\text{Chebyshev distance: }d(x_i,x_j) = \Vert x_i - x_j\Vert_4 =  \max_{k=1}^m |x_{ik} - x_{jk}|$

- $\text{Canberra distance: }d(x_i,x_j) = \sum_{k=1}^{m} \frac{|x_{ik} - x_{jk}|}{|x_{ik}| + |x_{jk}|}$

- $\text{Cosine distance: }d(x_i,x_j) = 1 - \frac{x_i \cdot x_j}{\Vert x_i\Vert \Vert x_j\Vert} = 1 - \frac{\sum_{k=1}^m x_{ik} x_{jk}}{\sqrt{\sum_{k=1}^m x_{ik}^2} \sqrt{\sum_{k=1}^m x_{jk}^2}}$

- $\text{Correlation distance: }d(x_i, x_j) = 1 - \frac{\sum_{k=1}^{m} (x_{ik} - \bar{x_i})(x_{jk} - \bar{x_j})}{\sqrt{\sum_{k=1}^{m} (x_{ik} - \bar{x_i})^2} \sqrt{\sum_{k=1}^{m} (x_{jk} - \bar{x_j})^2}}$

- $\text{Clark distance: }d(x_i,x_j) = \sqrt{\sum_{k=1}^{m} \left(\frac{|x_{ik} - x_{jk}|}{x_{ik} + x_{jk}}\right)^2}$

- $\text{Soergel distance: }d(x_i,x_j) = \frac{\sum_{k=1}^{m} |x_{ik} - x_{jk}|}{\sum_{k=1}^{m} \max(x_{ik},x_{jk})}$

- $\text{Hamming distance: }d(x_i,x_j) = \sum_{k=1}^m \mathbb{I}(x_{ik} \neq x_{jk})$

- $\text{Jaccard distance: }d(x_i,x_j) = 1 - \frac{|x_i \cap x_j|}{|x_i \cup x_j|} = 1 - \frac{\sum_{k=1}^{m} x_{ik} \cdot x_{jk}}{\sum_{k=1}^{m} (x_{ik} + x_{jk}) - \sum_{k=1}^{m} x_{ik} \cdot x_{jk}}$

- $\text{Dice distance: }d(x_i,x_j) = 1 - \frac{2|x_i \cap x_j|}{|x_i| + |x_j|} = 1 - \frac{2 \cdot \sum_{k=1}^{m} x_{ik} \cdot x_{jk}}{\sum_{k=1}^{m} x_{ik} + \sum_{k=1}^{m} x_{jk}}$


### Distance metric data type and ranges
| Distance Name | Data Type | Range | Origin | Ref. |
|----------|----------|----------|----------|----------|
| Euclidean distance         | Numerical          | $[0, +\infty\rangle$ | $d$ | [2][7]|
| Squared Euclidean distance | Numerical          | $[0, +\infty\rangle$ | $d$ | [2][7]|
| City block distance        | Numerical          | $[0, +\infty\rangle$ | $d$ | [2][7]|
| Chebyshev distance         | Numerical          | $[0, +\infty\rangle$ | $d$ | [2][7]|
| Canberra distance          | Numerical          | $[0, +\infty\rangle$ | $d$ | [2]|
| Cosine distance            | Numerical          | $[0, +1]$            | $s$ | [7]|
| Correlation distance       | Numerical          | $[0, +2]$            | $d$ | [7]|
| Clark distance             | Numerical          | $[0, +\infty\rangle$ | $d$ | [1]|
| Soergel distance           | Numerical          | $[0, +1]$            | $d$ | [2]|
| Hamming distance           | Categorical        | $[0, +\infty\rangle$ | $d$ | [4]|
| Jaccard distance           | Categorical        | $[0, +1]$            | $s$ | [5]|
| Dice distance              | Categorical        | $[0, +1]$            | $s$ | [3]|

## Transform distance to similarity
For bounded distances like cosine, Jaccard, and Dice, the relationship can be expressed as $d(x_i, x_j) = 1 - s(x_i, x_j)$, allowing for straightforward transformation in both directions [8].

**Example usage.**
```m
X = rand(10,2);
D = compdist(X, 'cosine');
S = 1 - D;
disp(S);
```
For unbounded distance metrics, the transformation to similarity is typically given by $s(x_i, x_j) = \exp\left(-\frac{d^2(x_i, x_j)}{\sigma^2}\right)$, where $\sigma > 0$ is a parameter [9][10].

**Example usage.**
```m
X = rand(10,2);
D = compdist(X, 'euclidean');
S = exp(-D.^2);
disp(S);
```

## References

1. [Abu Alfeilat, H. A., Hassanat, A. B., Lasassmeh, O., Tarawneh, A. S., Alhasanat, M. B., Eyal Salman, H. S., & Prasath, V. S. (2019). Effects of distance measure choice on k-nearest neighbor classifier performance: a review. Big data, 7(4), 221-248.](https://doi.org/10.1089/big.2018.0175)

2. [Cha, S. H. (2007). Comprehensive survey on distance/similarity measures between probability density functions. City, 1(2), 1.](https://pdodds.w3.uvm.edu/research/papers/others/everything/cha2007a.pdf)

3. [Dice, L. R. (1945). Measures of the amount of ecologic association between species. Ecology, 26(3), 297-302.](https://doi.org/10.2307/1932409)

4. [Hamming, R. W. (1950). Error detecting and error correcting codes. The Bell system technical journal, 29(2), 147-160.](https://doi.org/10.1002/j.1538-7305.1950.tb00463.x)

5. [Murphy, A. H. (1996). The Finley affair: A signal event in the history of forecast verification. Weather and forecasting, 11(1), 3-20.](https://doi.org/10.1175/1520-0434(1996)011%3C0003:TFAASE%3E2.0.CO;2)

6. [Scitovski, R., Sabo, K., Martínez-Álvarez, F., & Ungar, Š. (2021). Cluster analysis and applications (2021st ed.). Cham, Switzerland: Springer Nature.](https://link.springer.com/book/10.1007/978-3-030-74552-3)

7. [Wierzchon, S. T., & Klopotek, M. (2018). Modern Algorithms of Cluster Analysis (1st ed.). Cham, Switzerland: Springer International Publishing.](https://link.springer.com/book/10.1007/978-3-319-69308-8)

8. [Miyamoto, S. (2022). Theory of agglomerative hierarchical clustering (2022nd ed.). Singapore, Singapore: Springer.](https://link.springer.com/book/10.1007/978-981-19-0420-2)

9. [Von Luxburg, U. (2007). A tutorial on spectral clustering. Statistics and computing, 17, 395-416.](https://link.springer.com/article/10.1007/s11222-007-9033-z)

10. [The MathWorks, Inc. (2025). Statistics and machine learning toolbox (Version 24.2.0 R2024b). The MathWorks, Inc.](https://www.mathworks.com/products/statistics.html)

## Citation
Pyae, A., Low, Y. C., & Chua, H. N. (2024, August). A Combined Distance Metric Approach with Weight Adjustment For Improving Mixed Data Clustering Quality. In 2024 IEEE International Conference on Artificial Intelligence in Engineering and Technology (IICAIET) (pp. 183-188). IEEE.
```bibtex
@INPROCEEDINGS{10730392,
  author={Pyae, Aung and Low, Yeh-Ching and Chua, Hui Na},
  booktitle={2024 IEEE International Conference on Artificial Intelligence in Engineering and Technology (IICAIET)}, 
  title={A Combined Distance Metric Approach with Weight Adjustment For Improving Mixed Data Clustering Quality}, 
  year={2024},
  volume={},
  number={},
  pages={183-188},
  keywords={Measurement;Refining;Clustering algorithms;Learning (artificial intelligence);Complexity theory;Optimization;Distance Metrics;Mixed Data;Hierarchical Clustering;Unsupervised Learning},
  doi={10.1109/IICAIET62352.2024.10730392}
}
```