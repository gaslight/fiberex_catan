import { useState, useEffect, useMemo, useLayoutEffect } from "react"
import { useControls } from "leva"
import WoodsTile from "../models/WoodsTile"
import OreTile from "../models/OreTile"
import BrickTile from "../models/BrickTile"
import SheepTile from "../models/SheepTile"
import WheatTile from "../models/WheatTile"
import DesertTile from "../models/DesertTile"
import Harbor from "../models/Harbor"
import Road from "./Road"
import socket from "../../js/user_socket.js"
import Value2 from "../models/TileValues/Value2"

import { calculateBoardPositions } from "../helperFunctions/BoardSetupFunctions"
let channel = socket.channel("board:lobby", {})

const valueMap = {
  2: <Value2 />,
}

function Board() {
  const [tiles, setTiles] = useState([])
  const { size } = useControls({ size: 45 })
  const [map, setMap] = useState([])

  const mappedPositions = useMemo(() => calculateBoardPositions(size), [size])

  useLayoutEffect(() => {
    setTiles(mappedPositions)
    channel.on("board_state_updated", (resp) => setMap(resp))
    channel
      .join()
      .receive("ok", (resp) => {
        console.log("Joined successfully", resp)
      })
      .receive("error", (resp) => {
        console.log("Unable to join", resp)
      })
    channel.push("ping", { message: "This is a payload" })
  }, [])

  useEffect(() => {
    console.log("map", map)
  }, [map])

  return (
    <>
      {/* <Road /> */}
      {/* <Value2 /> */}
      {map?.board_state?.tiles &&
        map.board_state.tiles.map((piece, i) => {
          const q = piece.location.q
          const r = piece.location.r
          const position = [
            ((q * 3) / 2) * size,
            0,
            size * ((Math.sqrt(3) / 2) * q + Math.sqrt(3) * r),
          ]
          switch (piece.resource) {
            case "lumber":
              return (
                <WoodsTile
                  key={i}
                  position={position}
                  tileValue={valueMap[2]}
                />
              )
            case "ore":
              return <OreTile key={i} position={position} />
            case "brick":
              return <BrickTile key={i} position={position} />
            case "wool":
              return <SheepTile key={i} position={position} />
            case "grain":
              return <WheatTile key={i} position={position} />
            case "desert":
              return <DesertTile key={i} position={position} />
            case "harbor":
              return <Harbor key={i} position={position} />
            default:
              return null
          }
        })}
    </>
  )
}

export default Board
