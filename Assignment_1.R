x <- c(1, 2, 3, 4, 5, 6)
y <- c(7, 8, 9, 10, 11, 12)
z <- rbind(x, y)
rownames = c("werewolves", "vampires")
colnames = c("skittles", "babe ruth", "kitkat", "milky way", "3 musketeers", "take5")
dimnames = list(rownames, colnames)
M = matrix(z, nrow = 2, ncol = 6, dimnames = dimnames)
M
