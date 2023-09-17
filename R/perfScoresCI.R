perfScoresCI <- function(pred, truth, namePos, wBS = 0.5, scores = "all",
                         transform = FALSE, conf.level = 0.95, 
                         type = "boot", R = 9999, bootci.type = "bca", 
                         sampling = c("with", "under", "over"),
                         alternative = c("two.sided", "less", "greater")){
  if (!is.na(pmatch(method, "boot")))
    method <- "boot"
  METHODS <- c("boot")
  method <- pmatch(method, METHODS)
  sampling <- match.arg(sampling)
  alternative <- match.arg(alternative)
  
  if (is.na(method))
    stop("invalid method")
  if (method == -1)
    stop("ambiguous method")
  
  est <- perfScores(pred = pred, truth = truth, namePos = namePos, 
                    wBS = wBS, scores = scores, transform = transform)
  
  if(method == 1){ # boot
    DATA <- data.frame(pred = pred, truth = truth)
    boot.scores <- function(x, i, namePos, wBS, scores, transform){
      
      est <- perfScores(pred = x$pred[i], truth = x$truth[i], namePos = namePos, 
                        wBS = wBS, scores = scores, transform = transform)
    }
  }

#  res <- list(score = scoreNames, value = scoreValues)
#  class(res) <- "perfScore"
#  res
}
