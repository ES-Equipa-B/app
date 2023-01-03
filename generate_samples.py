import random
from datetime import datetime, timedelta

base_temperature = random.uniform(15, 22)
base_wind = random.uniform(23, 40)
base_humidity = random.uniform(20, 30)
now = datetime.now()

output = ''

for i in range(10):
    timestamp = (now - timedelta(minutes=i))
    output = output + str(timestamp.hour).zfill(2) + \
        str(timestamp.minute).zfill(2)
    output = output + str(int(random.uniform(base_wind * 0.9, base_wind * 1.1) * 10)).zfill(4)
    output = output + str(int(random.uniform(base_humidity * 0.9, base_humidity * 1.1))).zfill(3)
    temp = int(random.uniform(base_temperature * 0.9, base_temperature * 1.1) * 10)
    output = output + ('1' if temp < 0 else '0') + str(abs(temp)).zfill(3)

print(output)

