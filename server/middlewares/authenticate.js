import appError from "../utils/appError";
import { getTokenFromHeader, verifyToken } from "../utils/tokenService";

export const isAuthenticated = (req, res, next) => {
  const token = getTokenFromHeader(req);

  const decodedUser = verifyToken(token);

  req.userAuth = decodedUser.id;

  if (!decodedUser) {
    return next(appError("Invalid / Expired token", 401));
  } else {
    next();
  }
};
