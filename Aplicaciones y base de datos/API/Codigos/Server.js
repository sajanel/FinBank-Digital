const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const cors = require('cors');
const helmet = require('helmet');

// Crear una instancia de Express
const app = express();

// Middleware de seguridad
app.use(helmet());  // Protege tu aplicación de vulnerabilidades comunes
app.use(cors());    // Permite solicitudes de otros dominios

// Middleware para analizar el cuerpo de las solicitudes
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Conectar a MongoDB (asegúrate de tener MongoDB corriendo en localhost)
mongoose.connect('mongodb://localhost:27017/transferDB', { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log('Conectado a MongoDB'))
  .catch((err) => console.log('Error de conexión:', err));

// Esquema de Cliente
const clientSchema = new mongoose.Schema({
    name: String,           // Nombre del cliente
    account_number: String, // Número de cuenta
    bank_name: String,      // Nombre del banco
});

// Modelo de Cliente
const Client = mongoose.model('Client', clientSchema);

// Esquema de Transferencia
const transferSchema = new mongoose.Schema({
    client_id: { type: mongoose.Schema.Types.ObjectId, ref: 'Client' }, // Relación con Cliente
    amount: Number,         // Monto de la transferencia
    transfer_time: { type: Date, default: Date.now }, // Hora de la transferencia
});

// Modelo de Transferencia
const Transfer = mongoose.model('Transfer', transferSchema);

// Ruta para crear un cliente (POST /api/client)
app.post('/api/client', async (req, res) => {
    try {
        const { name, account_number, bank_name } = req.body;

        // Validación de campos
        if (!name || !account_number || !bank_name) {
            return res.status(400).json({ message: 'Faltan datos del cliente' });
        }

        // Crear un nuevo cliente
        const newClient = new Client({ name, account_number, bank_name });

        // Guardar el cliente en la base de datos
        await newClient.save();

        return res.status(201).json({ message: 'Cliente creado correctamente', client: newClient });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ message: 'Error interno del servidor' });
    }
});

// Ruta para crear una transferencia (POST /api/transfer)
app.post('/api/transfer', async (req, res) => {
    try {
        const { client_id, amount } = req.body;

        // Validar campos
        if (!client_id || !amount) {
            return res.status(400).json({ message: 'Faltan datos de la transferencia' });
        }

        // Validar ID del cliente
        const client = await Client.findById(client_id);
        if (!client) {
            return res.status(400).json({ message: 'Cliente no encontrado' });
        }

        // Crear una nueva transferencia
        const newTransfer = new Transfer({
            client_id,
            amount,
        });

        // Guardar la transferencia en la base de datos
        await newTransfer.save();

        return res.status(201).json({ message: 'Transferencia registrada correctamente', transfer: newTransfer });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ message: 'Error interno del servidor' });
    }
});

// Ruta GET para obtener todos los clientes (GET /api/client)
app.get('/api/client', async (req, res) => {
    try {
        const clients = await Client.find();
        return res.status(200).json({ clients });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ message: 'Error al obtener los clientes' });
    }
});

// Ruta GET para obtener un cliente específico por ID (GET /api/client/:id)
app.get('/api/client/:id', async (req, res) => {
    try {
        const { id } = req.params;

        // Validar ID
        if (!mongoose.Types.ObjectId.isValid(id)) {
            return res.status(400).json({ message: 'ID no válido' });
        }

        const client = await Client.findById(id);

        if (!client) {
            return res.status(404).json({ message: 'Cliente no encontrado' });
        }

        return res.status(200).json({ client });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ message: 'Error al obtener el cliente' });
    }
});

// Ruta GET para obtener todas las transferencias (GET /api/transfer)
app.get('/api/transfer', async (req, res) => {
    try {
        const transfers = await Transfer.find().populate('client_id');
        return res.status(200).json({ transfers });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ message: 'Error al obtener las transferencias' });
    }
});

// Ruta GET para obtener una transferencia específica por ID (GET /api/transfer/:id)
app.get('/api/transfer/:id', async (req, res) => {
    try {
        const { id } = req.params;

        // Validar ID
        if (!mongoose.Types.ObjectId.isValid(id)) {
            return res.status(400).json({ message: 'ID no válido' });
        }

        const transfer = await Transfer.findById(id).populate('client_id');

        if (!transfer) {
            return res.status(404).json({ message: 'Transferencia no encontrada' });
        }

        return res.status(200).json({ transfer });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ message: 'Error al obtener la transferencia' });
    }
});

// Ruta PUT para actualizar un cliente (PUT /api/client/:id)
app.put('/api/client/:id', async (req, res) => {
    try {
        const { id } = req.params;
        const { name, account_number, bank_name } = req.body;

        // Validar ID
        if (!mongoose.Types.ObjectId.isValid(id)) {
            return res.status(400).json({ message: 'ID no válido' });
        }

        const updatedClient = await Client.findByIdAndUpdate(
            id,
            { name, account_number, bank_name },
            { new: true }
        );

        if (!updatedClient) {
            return res.status(404).json({ message: 'Cliente no encontrado' });
        }

        return res.status(200).json({ message: 'Cliente actualizado', client: updatedClient });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ message: 'Error al actualizar el cliente' });
    }
});

// Ruta DELETE para eliminar un cliente (DELETE /api/client/:id)
app.delete('/api/client/:id', async (req, res) => {
    try {
        const { id } = req.params;

        // Validar ID
        if (!mongoose.Types.ObjectId.isValid(id)) {
            return res.status(400).json({ message: 'ID no válido' });
        }

        const deletedClient = await Client.findByIdAndDelete(id);

        if (!deletedClient) {
            return res.status(404).json({ message: 'Cliente no encontrado' });
        }

        return res.status(200).json({ message: 'Cliente eliminado', client: deletedClient });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ message: 'Error al eliminar el cliente' });
    }
});

// Ruta DELETE para eliminar una transferencia (DELETE /api/transfer/:id)
app.delete('/api/transfer/:id', async (req, res) => {
    try {
        const { id } = req.params;

        // Validar ID
        if (!mongoose.Types.ObjectId.isValid(id)) {
            return res.status(400).json({ message: 'ID no válido' });
        }

        const deletedTransfer = await Transfer.findByIdAndDelete(id);

        if (!deletedTransfer) {
            return res.status(404).json({ message: 'Transferencia no encontrada' });
        }

        return res.status(200).json({ message: 'Transferencia eliminada', transfer: deletedTransfer });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ message: 'Error al eliminar la transferencia' });
    }
});

// Iniciar el servidor en el puerto 3000
app.listen(3000, () => {
    console.log('Servidor corriendo en http://localhost:3000');
});
