import express from "express";
import {
  paging,
  order_list,
  order_one,
  received_list,
  received_one,
  get_order_one,
  change_received_one,
} from "./driver.controller.js";

const router = express.Router();

router.get("/", paging);

//NOT RECEIVED ORDER LIST
router.get("/order_list", order_list);
router.get("/order_list/:id", order_one);
router.post("/order_list/:id", get_order_one);

//DRIVER RECEIVED LIST
router.get("/received_list", received_list);
router.get("/received_list/:id", received_one);
router.post("/received_list/:id", change_received_one);
export default router;
