import os
from sys import argv
import bottle
from bottle import route, run, template, static_file, request
from services.sandwiches import getAllSandwiches, getSandwich, sendSandwich
STATIC_PATH = os.path.abspath(os.path.dirname(__file__)) + '/static'

@route('/')
def index():
    sandwiches = getAllSandwiches()
    return template('index', sandwiches=sandwiches)

@route('/sandwich/<id>')
def showSandwich(id):
    sandwich = getSandwich(id)
    return template('show', sandwich=sandwich)

@route('/build/')
def buildSandwich():
    return template('builder')

@route('/static/<filename:path>')
def send_static(filename):
    return static_file(filename, root=STATIC_PATH)

@route('/send-sandwich', method='POST')
def doSendSandwich():
    sandwich = request.forms.get('sandwich')
    response = sendSandwich(sandwich)
    return response
    #return sandwich





#run(host='localhost', port=8080, debug=True)
#bottle.run(host='0.0.0.0', port=argv[1])
run(host="0.0.0.0", port=int(os.environ.get("PORT", 5000)))
