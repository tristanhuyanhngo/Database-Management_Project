// import categoryModel from '../models/category.model.js';

// export default function (app) {
//     app.use(async function (req, res, next) {
//         if(typeof (req.session.auth)==='undefined'){
//             req.session.auth=false;
//         }

//         res.locals.auth=req.session.auth;
//         res.locals.authUser=req.session.authUser;
//         next();
//     });

//     app.use(async function (req, res, next) {
//         let lcCategories = await categoryModel.findAllWithDetails();
//         for (let i in lcCategories) {
//             let category = lcCategories[i];
//             lcCategories[i].childCat = await categoryModel.findFromBigCategory(category.BigCatID);
//         }
//         res.locals.lcCategories = lcCategories;
//         next();
//     });
// }