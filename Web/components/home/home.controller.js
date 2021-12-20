import store from "store";

export function paging(req, res) {
  res.render('home/views/home');
  console.log( store.get("user"))
}
