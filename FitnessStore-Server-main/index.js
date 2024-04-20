const cors = require('cors');
var express = require('express');
const path = require('path');
var app = express();
const bodyParser = require('body-parser');




app.use(bodyParser.json({limit: '50mb'}));
app.use(cors());
app.use('/resource', express.static(path.join(__dirname, 'resource')));


//routess
const accountServices = require('./routes/account');
const productServices = require('./routes/product');
const categoryServices = require('./routes/category');
const brandServices = require('./routes/brand');
const roleServices = require('./routes/role');
const cartServices = require('./routes/cart');
const postServices = require('./routes/post');
const post_contentServices = require('./routes/post_content');
const orderServices = require('./routes/order');
const recommendServices = require('./routes/recommend');
const statistic = require('./routes/product.statistics');

app.use('/account',accountServices);
app.use('/product',productServices);
app.use('/category',categoryServices);
app.use('/brand',brandServices);
app.use('/role',roleServices);
app.use('/cart',cartServices);
app.use('/post',postServices);
app.use('/post_content',post_contentServices);
app.use('/order',orderServices);
app.use('/recommend',recommendServices);
app.use('/statistic',statistic);

app.listen(80,async()=>{
    console.log('server running on port 80');
})


