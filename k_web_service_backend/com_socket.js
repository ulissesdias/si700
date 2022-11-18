const express = require('express');
const cors = require("cors")
const app = express();

app.use(express.json());
app.use(cors());



app.get('/', function(req, res){res.send('Hello world')});

/*
  Servidor propriamente dito
*/

const notes = [
    {id: 0, title: "Meu Primeiro Título", description : "Minha Primeira Descrição"},
    {id: 1, title: "Meu Segundo Título", description : "Minha Segunda Descrição"}
]

const endpoint = "/notes";

app.get(endpoint, function(req, res){
    res.send(notes.filter(Boolean));
});

app.get(`${endpoint}/:id`, function(req, res){
    const id = req.params.id;
    const note = notes[id];

    if (!note){
        res.send("{}");
    } else {
        res.send(note);
    }   
});

app.post(endpoint, (req, res) => {
    const note = {
        id : notes.length,
        title : req.body["title"],
        description : req.body["description"]
    };
    notes.push(note);
    res.send("1");

    notify(notes.length, note["title"], note["description"]);
});

app.put(`${endpoint}/:id`, (req, res) =>{
    const id = parseInt(req.params.id);
    const note = {
        id : id,
        title : req.body["title"],
        description : req.body["description"]
    };

    notes[id] = note;
    res.send("1");

    notify(parseInt(id), note["title"], note["description"]);
});

app.delete(`${endpoint}/:id`, (req, res) => {
    const id = req.params.id;
    delete notes[id];
    res.send("1");

    // Notificar todos
    notify(id, "", "");
});


/*
  Parte do Socket
*/
let SERVER_INFORMATION = 'server_information';

//app.listen(3000);
var server = require('http').createServer(app);
var io = require('socket.io')(server);
server.listen(process.env.PORT || 3000);

function notify(noteId, title, description){
    console.log(title);
    io.sockets.emit(SERVER_INFORMATION,
		    {
			"noteId" : noteId,
			"title" : title,
			"description" : description
		    }
		   );
}

