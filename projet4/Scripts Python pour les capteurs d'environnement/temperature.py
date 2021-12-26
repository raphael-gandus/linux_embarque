from sense_hat import SenseHat

sense = SenseHat()
sense.clear()

temp = round(sense.get_temperature(),2)

print(temp)

