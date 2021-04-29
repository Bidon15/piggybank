import React, { useContext, useEffect, useState } from "react";
import { PiggyBankContext } from "./../hardhat/SymfoniContext";

interface Props {}

export const PiggyBank: React.FC<Props> = () => {
  const piggyBank = useContext(PiggyBankContext);
  const [name, setName] = useState("");
  useEffect(() => {
    const doAsync = async () => {
      if (piggyBank.instance) {
        console.log("piggyBank is deployed at ", piggyBank.instance.address);
        setName(await piggyBank.instance.getName());
      }
    };
    doAsync();
  }, [piggyBank]);

  return <div>A PiggyBank! {name}</div>;
};
