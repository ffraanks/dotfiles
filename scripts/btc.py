#!/usr/bin/env python3

def cotacao():
    import requests
    import locale

    #definir locale para Brasil para formato de moeda
    locale.setlocale(locale.LC_ALL, 'en_US.UTF-8')

    #url da API Json do site Bitvalor
    url = "https://api.bitvalor.com/v1/ticker.json"

    #baixando os dados da página
    page = requests.get(url)

    #parseando os valores JSON para o objeto "data"
    data = page.json()

    price = data['ticker_24h']['exchanges']['MBT']['last']
    
    #formatando o preco para BRL
    price = locale.currency( price, grouping=True )

    return price

print(cotacao())
