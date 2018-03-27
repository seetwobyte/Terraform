# letter test for the grades game 

total = 100

score = 95


percent = score / total


student = "Scott"


if 1 >= percent >= 0.9:
    grade = "A"
elif 0.9 >= percent >= 0.8:
    graade = "B"
elif 0.8 >= percent >= 0.7:
    grade = "c"
elif 0.7 >= percent >= 0.6:
    grade = "D"
elif 0.6 >= percent:
    grade = "F"

print("Percentage is {}".format(percent))
print("{} - {}".format(student, grade))



