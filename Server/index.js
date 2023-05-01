const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./Routes/auth");
const adminRouter = require("./Routes/admin");
const productRouter = require("./Routes/product");
const userRouter = require("./Routes/user");

const PORT = 3000;

const app = express();

const DB =
  "mongodb+srv://safyantariq0001:safyantest123@cluster0.5ffsdk4.mongodb.net/?retryWrites=true&w=majority";
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connected to mongoose");
  })
  .catch((e) => {
    console.log(`Getting mongoose exception: ${e}`);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
