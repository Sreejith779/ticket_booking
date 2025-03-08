import bcrypt from "bcryptjs";

import User from "../models/User.js";

import { appError } from "../utils/appError.js";

import { generateToken } from "../utils/tokenService.js";

export const registerUser = async (req, res, next) => {
  try {
    const { fullName, email, phoneNumber, password } = req.body;

    const normalizedEmail = email.toLowerCase();

    const userExists = await User.findOne({ phoneNumber });

    if (userExists) {
      return next(appError("Phone number already exists", 409));
    }

    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    const newUser = await User.create({
      fullName,
      email: normalizedEmail,
      phoneNumber,
      password: hashedPassword,
    });

    res.status(201).json({
      fullName,
      accessToken: generateToken(newUser._id, fullName, "2hr"),
      refreshToken: generateToken(newUser._id, fullName, "20d"),
    });
  } catch (err) {
    next(appError(err.message));
  }
};

export const loginUser = async (req, res, next) => {
  try {
    const { phoneNumber, password } = req.body;

    const user = await User.findOne({ phoneNumber });

    if (!user) {
      return next(appError("User not found", 404));
    }

    const isPasswordCorrect = await bcrypt.compare(password, user.password);

    if (!isPasswordCorrect) {
      return next(appError("Invalid credentials", 400));
    }

    res.status(201).json({
      fullName: user.fullName,
      accessToken: generateToken(user._id, user.fullName, "2hr"),
      refreshToken: generateToken(user._id, user.fullName, "20d"),
    });
  } catch (err) {
    next(appError(err.message));
  }
};
