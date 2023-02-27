import express, { Application, Request, Response } from "express";
import { iUser } from "./types/type-user";
import { v4 as uuidv4 } from "uuid";
const app:Application = express();
app.use(express.json());
const PORT = 3000;

let users: iUser[] = [];

app.get("/", (req, res) => {
  res.json(users);
});
app.post("/", (req, res) => {
  const user = req.body as iUser;
  user.id = uuidv4();
  users.push(user);
  res.json({
    message: "user added succesfully",
  });
});

app.put("/:id" , (req, res) =>{
    const {id} = req.params;
    const updateUser: iUser = req.body;
    const findUser = users.filter((item) =>{
        return item.id !== id
    });
    findUser.push(updateUser)
    users = findUser

    res.json(findUser)

})
app.delete("/:id", (req, res) =>{
    const {id} = req.params
    const findUser = users.filter((item) => {
      return item.id !== id;
    });
    users = findUser;
    res.json({message: "user deleted seccefully"})
})

app.listen(PORT, () => console.log(`server listining on ${PORT}`));
