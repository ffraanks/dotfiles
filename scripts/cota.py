#!/bin/python3

from forex_python.converter import CurrencyCodes, CurrencyRates
c = CurrencyRates()
cd = CurrencyCodes()



def titulo(txt):
    print('-'*len(txt))
    print('\033[34m'+txt+'\033[0;0m')
    print('-'*len(txt))


def moeda():
    print('\033[35m\n1-BRL\n2-USD\n3-OUTRO:\n\33[0;0m')


# principal
while True:
    # 1 bloco : instruções
    titulo('CONVERSOR DE MOEDA')
    titulo('- INSIRA O VALOR DESEJADO PARA CAMBIAR\n- INSIRA A MOEDA INICIAL\n- INSIRA A MOEDA DE CAMBIO')
    titulo('VALOR INICIAL')

    while True:
        try:
            valor_inicial = float(
                input("insira o valor desejado para a operação:  \n"))
            break
        except ValueError:
            print(
                "\033[31m Opa!  entrada invalida.   insira valor valido\33[0;0m")

# 2 inserir moeda inical
    titulo('SELECIONE A MOEDA INICIAL')
    cod_moeda_inicial = None
    while cod_moeda_inicial not in (1, 2, 3):
        moeda()
        try:
            cod_moeda_inicial = int(input("selecione uma das 3 opções:  "))
            if cod_moeda_inicial == 1:
                cod_moeda_inicial = 'BRL'
                print("cod de escolha:", cod_moeda_inicial)
                break
            elif cod_moeda_inicial == 2:
                cod_moeda_inicial = 'USD'
                print("cod de escolha:", cod_moeda_inicial)
                break
            elif cod_moeda_inicial == 3:
                cod_moeda_inicial = input(
                    '\nOUTRO, codigo da moeda de escolha (3 digitos):').upper()
                print('codigo de escolha do pais de operação:', cod_moeda_inicial)
                break
        except:
            print(
                "\033[31m Opa! entrada invalida :(  SELECIONE AS OPÇÕES DISPONIVEIS\33[0;0m")

# 3 bloco inserir moeda para cambio
    titulo('SELECONE A MOEDA DE CAMBIO')
    cod_moeda_cambio = None
    while cod_moeda_cambio not in (1, 2, 3):
        moeda()
        try:
            cod_moeda_cambio = int(input("selecione uma das 3 opções:  "))
            if cod_moeda_cambio == 1:
                cod_moeda_cambio = 'BRL'
                print("cod de escolha:", cod_moeda_cambio)
                break
            elif cod_moeda_cambio == 2:
                cod_moeda_cambio = 'USD'
                print("cod de escolha:", cod_moeda_cambio)
                break
            elif cod_moeda_cambio == 3:
                cod_moeda_cambio = input(
                    '\nOUTRO, codigo da moeda de escolha (3 digitos):').upper()
                print('cod de escolha:', cod_moeda_cambio)
                break
        except:
            print(
                "\033[1;31m Opa! entrada invalida :(  SELECIONE AS OPÇÕES DISPONIVEIS\33[0;0m")

# 4 conversão
    titulo('CONVERSÃO...')
    result = c.convert(cod_moeda_inicial, cod_moeda_cambio, valor_inicial)
    simbolo_moeda = cd.get_symbol(cod_moeda_inicial)
    simbolo_moeda_cambio = cd.get_symbol(cod_moeda_cambio)
    result = round(result, 2)
    print(f'{cod_moeda_inicial}  -  {simbolo_moeda} {valor_inicial}   =  {cod_moeda_cambio}  -  {simbolo_moeda_cambio} { result}  ')
