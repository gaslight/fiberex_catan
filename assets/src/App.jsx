import { Suspense } from "react";
import { Canvas } from "@react-three/fiber";
import { Physics } from "@react-three/cannon";//not currently being used
import { Sky, OrbitControls } from "@react-three/drei";
import "./App.css";
import Board from "./components/Board";

function App() {
  return (
    <div className="anim">
      <Suspense fallback={null}>
        <Canvas camera={{ position: [0, 10, 50], fov: 50 }}>
          <Physics>
            <Sky />
            <OrbitControls makedefualt />
            <ambientLight intensity={0.8} />
            <spotLight position={[0, 10, 200]} />
            <Board />
          </Physics>
        </Canvas>
      </Suspense>
    </div>
  );
}

export default App;
