const express = require('express');

const app = express();
const endpoint = "/notes";

app.use(endpoint, express.json());
app.use("/database", express.json());


var cors = require('cors')
app.use(cors())

app.get('/', (req, res) => {
    res.send("Culpa do Cliente");
});

const notes = [
    {title : "Primeiro Título", description : "Essa é a primeira Descrição!"},
    {title : "Segundo Título", description : "Culpa do Cliente"}
];



app.get(endpoint, (req, res) => {
    res.send(notes);
});


app.get(`${endpoint}/:id`, (req, res) => {
    const id = req.params.id;
    const note = notes[id];

    if (note) {
	res.send(note);
    } else {
	res.send("{}");
    }
});

app.post(endpoint, (req, res) => {
    console.log(req);
    const note = {
	title : req.body["title"],
	description :  req.body["description"]
    }
    notes.push(note);
    res.send('1');
    notify(notes.length, note["title"], note["description"]);
});


app.put(`${endpoint}/:id`, (req, res) => {

    const id = req.params.id;
    const note = {
	title : req.body["title"],
	description :  req.body["description"]
    }
    notes[id] = note;

    res.send("1");
    notify(parseInt(id), note["title"], note["description"]);
});

app.delete(`${endpoint}/:id`, (req,res) => {
    const id = req.params.id;
    console.log(id);
    delete notes[id];
    res.send('1');

    notify(parseInt(id), "", "");
});

/*
  Stream
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

/*
 Parte do MongoDB
*/

const mongodb = require('mongodb')
const ObjectId = mongodb.ObjectId;
const password = process.env.PASSWORD || "XXXXXXXX";
const connectionString = `mongodb+srv://admin:${password}@cluster0.XXXXX.mongodb.net/myFirstDatabase?retryWrites=true&w=majority`;

const options = { 
    useNewUrlParser: true, 
    useUnifiedTopology: true 
}



async function connectToMongoDB(){
    const client = await mongodb.MongoClient.connect(connectionString,options);

    const db = client.db('myFirstDatabase');

    const mensagens = db.collection('mensagens');    

    console.log(await mensagens.find({}).toArray());

    const endpoint = "/database";


    /*
      Rotas
    */
    app.get(endpoint, async  (req, res) => {
        res.send(await mensagens.find({}).toArray());
    });
    
    app.get(`${endpoint}/:id`, async (req, res) => {
        const id = req.params.id;
        const note = await mensagens.findOne({
            _id: ObjectId(id)
        });
    
        if (note) {
        res.send(note);
        } else {
        res.send("{}");
        }
    });

    app.post(endpoint, async (req, res) => {
        const note = {
        title : req.body["title"],
        description :  req.body["description"]
        }
        const id = await mensagens.insertOne(note);
        res.send('1');

        notify(id.insertedId.toString(), note["title"], note["description"]);
    });
    
    
    app.put(`${endpoint}/:id`, async (req, res) => {
    
        const id = req.params.id;
        const note = {
        title : req.body["title"],
        description :  req.body["description"]
        }
        notes[id] = note;

        await mensagens.updateOne({_id : ObjectId(id)},
        {$set: note}
        );
    
        res.send("1");
        notify(id, note["title"], note["description"]);
    });
    
    app.delete(`${endpoint}/:id`, async (req,res) => {
        const id = req.params.id;
        console.log(id);
        await mensagens.deleteOne({_id : ObjectId(id)});
        res.send('1');
    
        notify(id, "", "");
    });    
}
connectToMongoDB();

/*
 Tentando se conectar ao servidor

const { MongoClient } = require('mongodb');

const client = new MongoClient(uri, );
client.connect(err => {
  const collection = client.db("test").collection("devices");
  // perform actions on the collection object
  client.close();
});


*/
