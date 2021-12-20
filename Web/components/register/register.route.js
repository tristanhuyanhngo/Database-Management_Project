import express from "express";
import {
  driver,
  customer,
  partner,
  driverRegister,
  customerRegister,
  partnerRegister
} from "./register.controller.js";
const router = express.Router();

router.get("/driver", driver);
router.post("/driver", driverRegister);

router.get("/customer", customer);
router.post("/customer", customerRegister);

router.get("/partner", partner);
router.post("/partner", partnerRegister);

export default router;
