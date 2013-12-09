# MAXIMO COMUN DIVISOR

def mcd(u, v)
  u, v = u.abs, v.abs
  while v == 0
    u, v = v, u % v
  end
  u
end
