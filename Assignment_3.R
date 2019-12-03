# Start out with a term of n = 10, an nominal interest rate of i  = 0.04 convertible semiannually, and a redemption value of
# F = C = 200000. Calculate the annual effective interest rate, the bond price, and then calculate the yearly write-downs. Start with
# an initial vector of (0, 0, book_value) that represents the starting time, calculate the interest paid per period, 
# the write-down per period, and the book value for each period. Display the data in a 
# table.


n <- 10
i <- 0.04
r <- 0.06
C <- 10000
F <- C
i_annual <- ((1 + (i/2)) ^ 2) - 1

v <- 1/(1+i_annual)
a_angle <- ((1 - (v^10))/i_annual)
coupon_size <- F * r

book_value <- coupon_size * a_angle + C*(v^10)

x_vec <- c(0, 0, book_value)
X <- x_vec


for(time in 1:n+1){
  I <- book_value * i_annual
  P <- coupon_size - I
  book_value <- book_value - P
  x_vec <- c(round(I, digits = 2), round(P, digits = 2), round(book_value, digits = 2))
  X <- rbind(X, x_vec)
}

colnames = c("Interest Paid", "Write Down", "Book Value")
rownames = c("Start", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10")
dimnames = list(rownames, colnames)
X <- matrix(X, nrow = 11, ncol = 3, dimnames = dimnames)
X
