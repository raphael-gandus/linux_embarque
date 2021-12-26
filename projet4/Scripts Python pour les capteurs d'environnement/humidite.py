from sense_hat import SenseHat

sense = SenseHat()
sense.clear()

humidite = round(sense.get_humidity(),2)

print (humidite)