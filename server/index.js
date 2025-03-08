import express from "express";
import dotenv from "dotenv";

import { globalErrorHandler } from "./middlewares/globalErrorHandler.js";
import { dbConnect } from "./config/dbConnect.js";

import userRoute from "./routes/userRoute.js";

dotenv.config();
dbConnect();

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use("/api/v1/user", userRoute);

// Global errors
app.use(globalErrorHandler);

// 404 Error
app.use("*", (req, res) => {
  res.status(404).json({
    message: `${req.originalUrl} - Path not found`,
  });
});

const PORT = process.env.PORT || 8080;

app.listen(PORT, () => {
  console.log(`Server is running`);
});

export default app;
