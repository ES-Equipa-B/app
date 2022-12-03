import random
import json
from datetime import datetime, timedelta

base_temperature = random.uniform(15, 22)
base_wind = random.uniform(23, 40)
base_humidity = random.uniform(20, 30)
now = datetime.now()

samples = []

for i in range(10):
    timestamp = (now + timedelta(minutes=i)).isoformat()
    wind = random.uniform(base_wind * 0.9, base_wind * 1.1)
    humidity = random.uniform(base_humidity * 0.9, base_humidity * 1.1)
    temp = random.uniform(base_temperature * 0.9, base_temperature * 1.1)
    samples.append({
        'wind': wind,
        'temperature': temp,
        'humidity': humidity,
        'timestamp': timestamp
    })

print(json.dumps(samples))

