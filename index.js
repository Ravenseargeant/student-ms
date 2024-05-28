const express = require('express');
const path = require('path');
const mysql = require('mysql');
const port = 3000;
const bcrypt = require('bcrypt');
const session = require('express-session');
const cookieParser = require('cookieParser');
const conn = mysql.createConnection({
  database:"school system",
  host: "localhost",
  user: "root",
  password: ""
})

const app = express();

app.set('view engine', 'ejs');
app.use(express.static("public"))

app.use(express.urlencoded({extended: true}))
app.use(session({
  secret:"raven", 
  resave: false, 
  saveUninitialized:false,
  cookie:{ maxAge:500000}
}))



app.get('/',(req, res)=>{
    res.render('home.ejs')
})

app.get("/Admin", (req, res) => {
  res.render("Admin.ejs")
})

app.get("/Teacher", (req, res) => {
  res.render("Teacher.ejs")
})

app.get("/Student", (req, res) => {
  res.render("Student.ejs")
})





app.listen(3000, (req, res) => {
  console.log("server listening on port 3000");
});



