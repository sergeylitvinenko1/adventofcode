elfs = []

with open ("2022_1_data.txt") as file: 
    elfs = file.readlines()

elfs = [item.strip("\n") for item in elfs]

results = []
temp = 0

for item in elfs: 
    if len(item) != 0: 
        temp = temp + int(item)
    else:
        results.append(temp)
        temp = 0
        continue
    
print(max(results))