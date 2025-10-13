// server.js
import { handler } from './build/handler.js'; // adjust the path if needed
import express from 'express';

const app = express();

// Specify the port you want to run on
const port = 4001

// Serve the app
app.use(handler);

// Start the server
app.listen(port, () => {
    console.log(`Server running on http://localhost:${port}`);
});
