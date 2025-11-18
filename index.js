const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("Bye!");
});

// Requires port mapping at runtime from Docker CLI with this command: docker run -p <port#>:<port#> <buildimage>
app.listen(8080, () => {
  console.log("Listening on Port 8080...");
});
