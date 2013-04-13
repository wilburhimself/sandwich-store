import requests

def getAllSandwiches():
    url = 'http://pixelpt-sandwich-api.herokuapp.com/sandwiches'
    response = requests.get(url)
    j = response.json()
    sandwiches = j['sandwiches']
    return sandwiches

def getSandwich(id):
    url = 'http://pixelpt-sandwich-api.herokuapp.com/sandwiches/' + id
    response = requests.get(url)
    sandwich = response.json()
    return sandwich['sandwich']

def sendSandwich(sandwichString):
    url = 'http://pixelpt-sandwich-api.herokuapp.com/sandwiches'
    headers = {'content-type': 'application/json'}
    data = sandwichString
    response = requests.post(url, data=data, headers=headers)
    return response

