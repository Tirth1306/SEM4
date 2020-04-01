import matplotlib.pyplot as plt
from itertools import count
import random
from matplotlib.animation import FuncAnimation

plt.style.use('ggplot')

fig = plt.figure(figsize=(16,9),dpi=300)
x_values=[]
y_values=[]

index = count()

def animate(i):
    x_values.append(index)
    y_values.append(random.randint(0,10))

    plt.plot(x_values,y_values)

ani = FuncAnimation(plt.gcf(),animate,interval = 1000)
plt.tight_layout()
plt.show()
