#!/bin/python3

import os
import sys
from num2words import num2words

os.system('clear')
numero = int(input('Digite um número inteiro: '))

num_en = num2words(numero, lang='en')
print(f'\nEm Inglês: {num_en}')

num_en_ord = num2words(numero, lang='en', to='ordinal')
print(f'\nEm inglês (ordinal): {num_en_ord}\n')
print('-' * 100)
num_pt = num2words(numero, lang='pt-br')
print(f'\nEm Português: {num_pt}')

num_pt_ord = num2words(numero, lang='pt-br', to='ordinal')
print(f'\nEm Português (ordinal): {num_pt_ord}')
sys.exit(0)

