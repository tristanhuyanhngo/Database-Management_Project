import express from "express";
import {
  paging,
  order_list,
  order_one,
  received_list,
  received_one,
  get_order_one,
  change_received_one,
  order_list2,
  order_one2,
  get_order_one2,
  order_list3,
  order_one3,
  get_order_one3,
} from "./driver.controller.js";

const router = express.Router();

router.get("/", paging);

//NOT RECEIVED ORDER LIST
router.get("/order_list", order_list);
router.get("/order_list2", order_list2);
router.get("/order_list3", order_list3);

router.get("/order_list/:id", order_one);
router.get("/order_list2/:id", order_one2);
router.get("/order_list3/:id", order_one3);

router.post("/order_list/:id", get_order_one);
router.post("/order_list2/:id", get_order_one2);
router.post("/order_list3/:id", get_order_one3);

//DRIVER RECEIVED LIST
router.get("/received_list", received_list);
router.get("/received_list/:id", received_one);
router.post("/received_list/:id", change_received_one);
export default router;
