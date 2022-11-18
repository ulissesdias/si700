const express = require('express');
const cors = require("cors")
const app = express();

app.use(express.json());
app.use(cors());
app.listen(3000);


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

});

app.delete(`${endpoint}/:id`, (req, res) => {
    const id = req.params.id;
    delete notes[id];
    res.send("1");

});


