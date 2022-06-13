const calculateBoardPositions = (size) => {
  const tileTypes = {
    sheep: 4,
    brick: 3,
    wheat: 4,
    woods: 4,
    desert: 1,
    ore: 3,
  };

  const positions = mockApiResponseForBoardPositions();
  const mappedPositions = positions.map((pos) => {
    const [q, r] = pos;

    const position = [
      ((q * 3) / 2) * size,
      0,
      size * ((Math.sqrt(3) / 2) * q + Math.sqrt(3) * r),
    ];

    const randomKey =
      Object.keys(tileTypes)[
        Math.floor(Math.random() * Object.keys(tileTypes).length)
      ];
    const tileType = randomKey;
    tileTypes[randomKey]--;

    if (tileTypes[randomKey] === 0) {
      delete tileTypes[randomKey];
    }

    return { position, tileType };
  });
  return mappedPositions;
};

const mockApiResponseForBoardPositions = () => {
  // This will be replaced with a real API call when we have one
  const positions = [];
  for (let i = -2; i <= 2; i++) {
    for (let j = -2; j <= 2; j++) {
      if (i + j < 3 && i + j > -3) {
        positions.push([i, j]);
      }
    }
  }
  return positions;
};

export { calculateBoardPositions };
