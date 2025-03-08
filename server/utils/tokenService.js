import jwt from "jsonwebtoken";

export const generateToken = (id, name, expiresIn = "20d") => {
  return jwt.sign({ id, name }, process.env.JWT_SECRET_KEY, {
    expiresIn,
  });
};

export const getTokenFromHeader = (req) => {
  const headerObject = req.headers;
  const token = headerObject["authorization"]?.split(" ")[1];

  if (token !== undefined) {
    return token;
  } else {
    return false;
  }
};

export const verifyToken = (token) => {
  try {
    return jwt.verify(token, process.env.JWT_SECRET_KEY);
  } catch (err) {
    return false;
  }
};
