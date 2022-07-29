import { useState, useEffect, useMemo } from "react";
import { useControls } from "leva";
import WoodsTile from "../models/WoodsTile";
import OreTile from "../models/OreTile";
import BrickTile from "../models/BrickTile";
import SheepTile from "../models/SheepTile";
import WheatTile from "../models/WheatTile";
import DesertTile from "../models/DesertTile";
import Harbor from "../models/Harbor";
import Road from "./Road";
import socket from "../../js/user_socket.js";

import { calculateBoardPositions } from "../helperFunctions/BoardSetupFunctions";

function Board() {
  const [tiles, setTiles] = useState([]);
  const { size } = useControls({ size: 45 });

  const mappedPositions = useMemo(() => calculateBoardPositions(size), [size]);

  useEffect(() => {
    setTiles(mappedPositions);
    let channel = socket.channel("board:lobby", {});
    channel.join();
    channel.push("ping", { message: "This is a payload" });
  }, []);

  return (
    <>
      {/* <Road /> */}
      {tiles.map((piece, i) => {
        switch (piece.tileType) {
          case "woods":
            return <WoodsTile key={i} position={piece.position} />;
          case "ore":
            return <OreTile key={i} position={piece.position} />;
          case "brick":
            return <BrickTile key={i} position={piece.position} />;
          case "sheep":
            return <SheepTile key={i} position={piece.position} />;
          case "wheat":
            return <WheatTile key={i} position={piece.position} />;
          case "desert":
            return <DesertTile key={i} position={piece.position} />;
          case "harbor":
            return <Harbor key={i} position={piece.position} />;
          default:
            return null;
        }
      })}
    </>
  );
}

export default Board;
