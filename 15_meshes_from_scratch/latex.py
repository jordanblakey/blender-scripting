import os

import bpy
import matplotlib.pyplot as plt
import sympy as sp
from sympy.parsing.latex import parse_latex

# external deps
# sudo apt-get install dvipng texlive-latex-extra texlive-fonts-recommended

# define an equation like this, but no control over the order
# x = sp.Symbol('x')
# y = sp.Symbol('y')
# a = sp.Symbol('a')
# b = sp.Symbol('b')
# r = sp.Symbol('r')

# circle_eq = sp.Eq((x - a) ** 2 + (y - b) ** 2, r ** 2)
# latex = sp.latex(circle_eq)

# writing latex directly allows controlling the order, optionally parse the latex to sympy
latex = r'\left(x - a\right)^2 + \left(y - b\right)^2 = r^2'
circle_eq: sp.Eq = parse_latex(latex)
print(latex)

print(circle_eq.args)
print(circle_eq.canonical)
print(circle_eq.free_symbols)


def render_latex(latex, filename='figure.png'):
    plt.rcParams['text.usetex'] = True
    plt.text(0.5, 0.5, r"$%s$" % latex, fontsize=30,
             horizontalalignment='center', verticalalignment='center')
    plt.axis('off')
    cwd = os.path.dirname(__file__)
    render_dir = os.path.join(cwd, 'renders')
    os.makedirs(render_dir, exist_ok=True)
    plt.savefig(os.path.join(render_dir, filename))


render_latex(latex)
