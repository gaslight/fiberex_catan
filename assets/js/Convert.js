const {ConvertGLBtoGltf} = require('gltf-import-export');



const inputGlb = 'public/glbFiles/Neat Snicket-Crift.glb'//take current Glb file
const KatanPieceGltf = 'public/glbFiles/KatanPiece.gltf' //and convert it to this file

ConvertGLBtoGltf(inputGlb, KatanPieceGltf); //run "node convert.js" to convert glb to gltf

