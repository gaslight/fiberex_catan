require Protocol

Protocol.derive(Jason.Encoder, Location, only: [:q, :r, :d])
