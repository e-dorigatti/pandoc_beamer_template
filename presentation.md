---
title: Presentation template (long title)
short-title: template (short title)
author: Author Name
institute:
 - Institute 1
 - Institute 2 \newline on two lines
short-institute: INST1, INST2
date: \today
bibliography: presentation.bib
theme: Warsaw
colortheme: beaver
outertheme: infolines
citation-style: vancouver-brackets.csl
link-citations: True
---

# Section title

## Slide title

Some content:

 - See [@gptNIPS] (clickable reference)
   1. This means you screwed up the references: [@nonExistingRef]
 - *Italic*
   - **Bold**

\vspace{1cm}

Vertical space to better separate things

# Section 2

## A fictional theoretical basis

An equation to appear smart:

\begin{equation}
\mathcal{L}=-\frac 1 N \sum_{i=1}^N \log p(y_i|x_i,\theta)+\sum_{i=1}^L \frac{\lambda^2 p^{keep}_i}{2N}||\theta_i||_2^2
\label{eq1}
\end{equation}

## Pretending that something was actually done

BAYESIAN DEEP LEARNING IN ONE SLIDE !!1!1!!1

```python
l2 = (1 - pdrop) * length_scale_squared / (2 * bsize)

inp = x = layers.Input(shape=(2,))  # input
x = layers.Dense(200, activation='relu',
                 kernel_regularizer=regularizers.l2(l2))(x)
x = layers.Dropout(pdrop)(x, training=True)
x = layers.Dense(200, activation='sigmoid',
                 kernel_regularizer=regularizers.l2(l2))(x)
x = layers.Dropout(pdrop)(x, training=True)
out = layers.Dense(2, activation='tanh',
                   kernel_regularizer=regularizers.l2(l2))(x)
```

# Section 3

## A nice centered picture

\centering\includegraphics[width=0.5\linewidth,height=0.5\textheight]{example-image-a}


## "Layouts"

Two-columns content following this very long line that is in a single column and wraps:

\begin{columns}
\column{0.6\textwidth}

Fancy linear models (unlike Eq. \ref{eq1})

$$
\log\frac{p(C_p|a_{p-4},\ldots,a_{p+1})}{p(C_p)}
= \sum_{i=-4}^1 \phi(a_{p+i}, i)
$$

\column{0.4\textwidth}

\begin{figure}
\centering\includegraphics[width=0.95\linewidth]{example-image-b}
\caption{A figure}
\label{fig}
\end{figure}

\begin{table}
\begin{tabular}{cc}
a & b \\
\hline
1 & 2 \\
3 & 4 \\
\end{tabular}
\caption{A table (also see Fig. \ref{fig})}
\end{table}

\end{columns}


# Thank you!

# References{.allowframebreaks}

