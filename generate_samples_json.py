import random
import json
from datetime import datetime, timedelta

base_temperature = random.uniform(15, 22)
base_wind = random.uniform(23, 40)
base_humidity = random.uniform(0.1, 0.7)
now = datetime.now()
# now = datetime.fromisoformat("2022-12-27T14:00")

samples = []

for i in range(100):
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

