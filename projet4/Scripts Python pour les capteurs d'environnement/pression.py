from sense_hat import SenseHat

sense = SenseHat()
sense.clear()

pression = round(sense.get_pressure(),2)

print(pression)

