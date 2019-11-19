# Start out with a term of n = 10, an annual effective interest rate of i  = 0.03, and an initial loan amount of
# L = 200000. Calculate the monthly effective interest rate, and then calculate the monthly payments. Start with
# an initial vector of (0, 0, L) that represents the starting time, calculate the interest paid per period, 
# the principal repaid per period, and the outstanding balance for each period. Display the data in a 
# table.


n <- 10
i <- 0.03
L <- 200000
i_monthly <- ((1 + i) ^ (1/12)) - 1

v <- 1/(1+i_monthly)
a_angle <- ((1 - (v^10))/i_monthly)
R <- L / (a_angle)

x_vec <- c(0, 0, L)
X <- x_vec


for(time in 1:n+1){
  I <- L * i_monthly
  P <- R - I
  L <- L - P
  x_vec <- c(round(I, digits = 2), round(P, digits = 2), round(L, digits = 2))
  X <- rbind(X, x_vec)
}

colnames = c("Interest Paid", "Principal Paid", "Outstanding Balance")
rownames = c("Start", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10")
dimnames = list(rownames, colnames)
X <- matrix(X, nrow = 11, ncol = 3, dimnames = dimnames)
X
  