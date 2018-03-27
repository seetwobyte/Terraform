lives = 10
stringword = "computer"
word = list(stringword.lower())

guess = [""] * len(word)

print(guess)

winner = False
incorrectletters = []

def printscore():
    print ("Lives: " + str(lives))
    print("Incorrect letters: ", end="")
    for x in range(len(incorrectletters)):
        if x ==len(incorrectletters)) -1:
            print(incorrectletters[x], end=""}
    else:
        print(incorrectletters[x]. ))