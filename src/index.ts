import express, { Application, Request, Response } from 'express';

const app: Application = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get('/', (req: Request, res: Response) => {
    return res.status(200).json({ success: true });
});

const PORT = parseInt(process.env.PORT!) || 5001;

app.listen(PORT, () => {
    console.log(`🚀...Backend live on PORT: ${PORT}...🚀`);
});
