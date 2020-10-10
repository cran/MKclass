## -----------------------------------------------------------------------------
library(MKclass)

## -----------------------------------------------------------------------------
## Example from Wikipedia
risks(p0 = 0.4, p1 = 0.1)
risks(p0 = 0.4, p1 = 0.5)

## -----------------------------------------------------------------------------
or2rr(or = 1.5, p0 = 0.4)
or2rr(or = 1/6, p1 = 0.1)

## -----------------------------------------------------------------------------
## Example from Wikipedia
rrCI(a = 15, b = 135, c = 100, d = 150)
rrCI(a = 75, b = 75, c = 100, d = 150)

## -----------------------------------------------------------------------------
x <- c(runif(50, max = 0.6), runif(50, min = 0.4))
g <- c(rep(0, 50), rep(1, 50))
AUC(x, group = g)

## -----------------------------------------------------------------------------
g <- c(rep(1, 50), rep(0, 50))
AUC(x, group = g)
## no switching
AUC(x, group = g, switchAUC = FALSE)

## -----------------------------------------------------------------------------
g <- c(rep(0, 50), rep(1, 50))
AUC.test(pred1 = x, lab1 = g)

## -----------------------------------------------------------------------------
x2 <- c(runif(50, max = 0.7), runif(50, min = 0.3))
g2 <- c(rep(0, 50), rep(1, 50))
AUC.test(pred1 = x, lab1 = g, pred2 = x2, lab2 = g2)

## -----------------------------------------------------------------------------
x3 <- c(x, x2)
g3 <- c(g, c(rep(2, 50), rep(3, 50)))
pairwise.auc(x = x3, g = g3)

## -----------------------------------------------------------------------------
## Example: HIV test 
## 1. ELISA screening test (4th generation)
predValues(sens = 0.999, spec = 0.998, prev = 0.001)
## 2. Western-Plot confirmation test
predValues(sens = 0.998, spec = 0.999996, prev = 1/3)

## -----------------------------------------------------------------------------
## example from dataset infert
fit <- glm(case ~ spontaneous+induced, data = infert, family = binomial())
pred <- predict(fit, type = "response")

## with group numbers
perfMeasures(pred, truth = infert$case, namePos = 1)
perfScores(pred, truth = infert$case, namePos = 1)

## with group names
my.case <- factor(infert$case, labels = c("control", "case"))
perfMeasures(pred, truth = my.case, namePos = "case")
perfScores(pred, truth = my.case, namePos = "case")

## using weights
perfMeasures(pred, truth = infert$case, namePos = 1, weight = 0.3)
perfScores(pred, truth = infert$case, namePos = 1, wBS = 0.3)

## -----------------------------------------------------------------------------
## example from dataset infert
fit <- glm(case ~ spontaneous+induced, data = infert, family = binomial())
pred <- predict(fit, type = "response")
optCutoff(pred, truth = infert$case, namePos = 1)

## -----------------------------------------------------------------------------
## Hosmer-Lemeshow goodness of fit tests for C and H statistic 
HLgof.test(fit = pred, obs = infert$case)
## e Cessie-van Houwelingen-Copas-Hosmer global goodness of fit test
HLgof.test(fit = pred, obs = infert$case, 
           X = model.matrix(case ~ spontaneous+induced, data = infert))

## -----------------------------------------------------------------------------
sessionInfo()

