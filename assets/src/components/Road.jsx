import React, {useRef} from 'react'
import {useControls} from 'leva'



function Road({color='red', position=[0,10,35]}) {
  const ref = useRef()
  const {length, width, height, x, y, z} = useControls({length: 28.2, width: 6, height: 9, x:-1.76, y: 8, z: 34.2})
  return (
    <>
      <mesh position={[x, y, z]}>
        <boxBufferGeometry attach="geometry" args={[length, width, height]} />
        <meshStandardMaterial attach="material" color={color} />
      </mesh>


    </>
  )
}

export default Road