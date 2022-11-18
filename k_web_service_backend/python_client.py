import socketio
sio = socketio.Client()
sio.connect("http://localhost:3000")

@sio.on("server_information")
def on_message(data) :
    print("I reived : " + str(data))
