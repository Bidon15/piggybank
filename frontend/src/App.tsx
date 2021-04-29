import React from "react";
import logo from "./logo.svg";
import "./App.css";
import { Symfoni } from "./hardhat/SymfoniContext";
import { PiggyBank } from "./components/PiggyBank";

function App() {
  return (
    <div>
      Hello
      <Symfoni>
        <PiggyBank></PiggyBank>
      </Symfoni>
    </div>
  );
}

export default App;
