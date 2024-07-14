import dionysus as d

s = d.Simplex([0,1,2])
print("Dimension:", s.dimension())

for v in s:
    print(v)

for sb in s.boundary():
    print(sb)
