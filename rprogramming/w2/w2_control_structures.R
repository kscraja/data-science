# if condition
if (x>23) {
   y <- 10
} else {
  y <- 0
}

x <- 2
y <- if(x>30) {10} else {20}

# for loop

for (i in 1:10) {
  print(i)
}

x <- c("a", "b", "c", "d")

for (i in 1:4) {
  print(x[i])
}

for (i in seq_along(x)) {
  print(x[i])
}

for (letter in x) {
  print(letter)
}

for (i in 1:4) print(x[i])

