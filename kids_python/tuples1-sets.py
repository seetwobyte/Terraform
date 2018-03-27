# Sets can only have one value in a list
# s

days = set(["Monday", "Tuesday", "Wednesday", "Wednesday"])

days.add("Friday")
days.add("Saturday")
# days.remove("Wednesday")

# days.discard("Friday")
print(days)
