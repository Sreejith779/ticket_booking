import express from "express";

const userRoute = express.Router();

import { loginUser, registerUser } from "../controllers/userController.js";

userRoute.post("/register", registerUser);

userRoute.post("/login", loginUser);

export default userRoute;
