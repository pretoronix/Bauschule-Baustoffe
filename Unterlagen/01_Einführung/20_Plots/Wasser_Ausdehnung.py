import numpy as np
import matplotlib.pyplot as plt
import os

# Temperaturbereich und Dichteformel (vereinfachte Näherung)
temperaturen = np.linspace(0, 10, 100)
dichten = (999.87 + 6.77e-2 * temperaturen - 9.095e-3 * temperaturen**2 + 
           1.001e-4 * temperaturen**3 - 1.12e-6 * temperaturen**4) / 1000

# Plot erstellen
f = plt.figure(figsize=(8, 5))
plt.plot(temperaturen, dichten, label='Dichte von Wasser', color='blue')

# Achsenbeschriftung und Titel
plt.xlabel('Temperatur (°C)')
plt.ylabel('Dichte (g/cm³)')
plt.title('Dichteanomalie von Wasser')
plt.legend()
plt.grid(True)

# Bereich von 0–10 °C hervorheben
plt.axvspan(0, 10, color='lightblue', alpha=0.3, label='0–10 °C hervorgehoben')

plt.show()
f.savefig('Wasser_Ausdehnung.png', dpi=600)

print(os.getcwd())