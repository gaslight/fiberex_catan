import { useState, useEffect, useMemo, useLayoutEffect } from "react";
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
import Value2 from "../models/TileValues/Value2";

import { calculateBoardPositions } from "../helperFunctions/BoardSetupFunctions";
let channel = socket.channel("board:lobby", {});
function Board() {
  const [tiles, setTiles] = useState([]);
  const { size } = useControls({ size: 45 });
  const [map, setMap] = useState([]);

  const mappedPositions = useMemo(() => calculateBoardPositions(size), [size]);

  useLayoutEffect(() => {
    setTiles(mappedPositions);
    channel.on("board_state_updated", resp => setMap(resp))
    channel.join()
    .receive("ok", resp => { console.log("Joined successfully", resp); })
    .receive("error", resp => { console.log("Unable to join", resp) })
    channel.push("ping", { message: "This is a payload" });
  }, []);

  useEffect(() => {
    console.log(map);
    }, [map]);

  return (
    <>
      {/* <Road /> */}
      <Value2 />
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
