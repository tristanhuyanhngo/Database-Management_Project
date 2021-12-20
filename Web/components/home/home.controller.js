import store from "store";

export function paging(req, res) {
  console.log(store.get("user"))
  res.render('home/views/home');
}
