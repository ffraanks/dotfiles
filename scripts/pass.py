#!/bin/python3

import random
import os
import sys
from string import digits
from string import punctuation
from string import ascii_letters

os.system('clear')

range_password = int(input('Digite o tamanho da senha com número inteiro: '))

symbols = ascii_letters + digits + punctuation
secure_random = random.SystemRandom()
password = "".join(secure_random.choice(symbols)
                    for i in range(range_password))
os.system('clear')
print(f'Sua senha é:\n\n{password}')
sys.exit(0)
