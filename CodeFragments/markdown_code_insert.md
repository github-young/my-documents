```python {cmd=“C:\\D\\study\\Anaconda\\python.exe” class=line-numbers cmd=true matplotlib=true}
#plt.rcParams['font.sans-serif']=['SimHei']
#plt.rcParams['axes.unicode_minus']=False
import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(0,2*np.pi,100)
y = np.sin(x)
plt.plot(x,y,'r-')
plt.grid()
plt.show()
```

```latex {cmd=true latex_zoom=2 latex_engine=xelatex class=line-numbers}
\documentclass{standalone}
\usepackage{ctex}
\begin{document}

测试。

Hello, \LaTeX !
\end{document}
```