<h1 align="center"> SI700 - Programação para Dispositivos Móveis </h1>

Esta página contém os arquivos para se executar o backend. Inicialmente, será preciso executar os seguintes comandos:

<pre>
npm init -y

npm install express

npm install cors --save

npm install socket.io

npm install mongodb
</pre>

Feito isso, basta executar algum dos arquivos JavaScript correspondentes ao que se deseja:


1. Para executar um serviço sem muitas funcionalidades, apenas fornecendo o endpoint /notes, então faça:

<pre>
node intro.js
</pre>

2. Para executar um serviço semelhante ao anterior, mas adicionando uma stream também no endpoint /notes, então faça:

<pre>
node com_stream.js
</pre>

3. Para executar um serviço semelhante ao anterior, mas adicionando uma configuração com o banco de dados MongoDB no endpoint /database, então faça:

<pre>
node com_mongo.js
</pre>


Para fins de depuração, um cliente em python é fornecido no arquivo python_client.py

