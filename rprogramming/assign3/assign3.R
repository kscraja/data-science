state <- "TX"
outcome <- "heart attack"
data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
# head(outcome)
# names(outcome)
# ncol(outcome)
# str(outcome)
# nrow(outcome)
# outcome[,11] <- as.numeric(outcome[,11])
# par(mar = rep(2,4))
# hist(outcome[,11])
# 
columnNames <- names(data)

# changing names of columns for mortality 

columnNames[11] <- "heart attack"
columnNames[17] <- "heart failure"
columnNames[23] <- "pneumonia"
names(data) <- columnNames

isValidState <- function(state) {
  state %in% data$State
}

isValidOutcome <- function(outcome) {
  (outcome %in% columnNames)   
}

baseData <- data

best <- function(state, outcome) {
  # lowest mortality column: 11 - Heart attack, 17 - Heart-failure, 23 - pneumonia 
  if (!isValidOutcome(outcome)) {
    stop("invalid outcome")
  }
  if (!isValidState(state)) {
    stop("invalid state")
  }
  
  mortalityOfOutcome <- data.frame(HospitalName = baseData$Hospital.Name, State=baseData$State, Mortality=as.numeric(baseData[[outcome]]))
  #removing NA from the dataframe
  mortalityOfOutcome <- mortalityOfOutcome[complete.cases(mortalityOfOutcome),]
  
  #splitting the dataset by state 
  s <- split(mortalityOfOutcome, mortalityOfOutcome$State)
  #picking the state data
  stateMortality <- s[[state]]
  #finding minimum
  minimumMortality <- min(stateMortality$Mortality)
  r <- sort(stateMortality[stateMortality$Mortality == minimumMortality,]$HospitalName)[1]
  as.character(r)
}

#print(best("TX", "heart attack"))
#print(best("TX", "heart failure"))
#print(best("MD", "heart attack"))

rankhospital <- function(state, outcome, rank) {
  # lowest mortality column: 11 - Heart attack, 17 - Heart-failure, 23 - pneumonia 
  if (!isValidOutcome(outcome)) {
    stop("invalid outcome")
  }
  if (!isValidState(state)) {
    stop("invalid state")
  }
  
  mortalityOfOutcome <- data.frame(HospitalName = baseData$Hospital.Name, State=baseData$State, Mortality=as.numeric(baseData[[outcome]]))
  #removing NA from the dataframe
  mortalityOfOutcome <- mortalityOfOutcome[complete.cases(mortalityOfOutcome),]
  
  #splitting the dataset by state 
  s <- split(mortalityOfOutcome, mortalityOfOutcome$State)
  #picking the state data
  stateMortality <- s[[state]]
  stateMortality$Order <- order(stateMortality$Mortality, stateMortality$HospitalName)
  bestRank = 1
  worstRank = nrow(stateMortality)
  if (rank == "best") {
    rank <- bestRank
  } else if (rank == "worst") {
    rank <- worstRank
  }
  
  if (rank <  bestRank || rank > worstRank) {
    as.character(NA)
  } else {
    hospitalAtGivenRank <- stateMortality[stateMortality$Order[rank], ]
    r <- hospitalAtGivenRank$HospitalName
    as.character(r)
  }
}

#print(rankhospital("TX", "heart failure", 4))
#print(rankhospital("MD", "heart attack", "worst"))
#print(rankhospital("MN", "heart attack", 5000))

rankall <- function(outcome, rank) {
  # lowest mortality column: 11 - Heart attack, 17 - Heart-failure, 23 - pneumonia 
  if (!isValidOutcome(outcome)) {
    stop("invalid outcome")
  }
  if (!isValidState(state)) {
    stop("invalid state")
  }
  
  mortalityOfOutcome <- data.frame(HospitalName = baseData$Hospital.Name, State=baseData$State, Mortality=as.numeric(baseData[[outcome]]))
  #removing NA from the dataframe
  mortalityOfOutcome <- mortalityOfOutcome[complete.cases(mortalityOfOutcome),]
  
  
  #picking the state data
  getHostpitalAtGivenRank <- function(stateMortality, rank) {
    stateMortality$Order <- order(stateMortality$Mortality, stateMortality$HospitalName)
    bestRank = 1
    worstRank = nrow(stateMortality)
    if (rank == "best") {
      rank <- bestRank
    } else if (rank == "worst") {
      rank <- worstRank
    }
    
    if (rank <  bestRank || rank > worstRank) {
      as.character(NA)
    } else {
      hospitalAtGivenRank <- stateMortality[stateMortality$Order[rank], ]
      r <- hospitalAtGivenRank$HospitalName
      as.character(r)
    }
  }
  #splitting the dataset by state 
  s <- split(mortalityOfOutcome, mortalityOfOutcome$State)
  allStateNames <- unique(mortalityOfOutcome$State)
  
  out <- data.frame(hospital=character(), state=character())
  names(out) <- c("hospital", "state")
  for(state in allStateNames) {
    hospital <- getHostpitalAtGivenRank(s[[state]], rank)
    out <- rbind(out, data.frame(hospital=hospital, state=state))
  }
  out
}

print(head(rankall("heart attack", 20), 10))
print(head(rankall("pneumonia", "worst"), 3))
