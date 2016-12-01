# Read folder
rxHadoopListFiles("/weathersql")

# Get data and Profile
incomepath <- file.path("/weathersql/Data.095293ff-c0bc-4989-98d9-8f267e8bd1bd.txt")
hdfsFS <-RxHdfsFileSystem()
incomedata <- RxTextData(incomepath, fileSystem = hdfsFS, stringsAsFactors = TRUE)
rxGetVarInfo(incomedata)

#
incomepath <- file.path("/weathersql/[poccortana].[monthly].txt")
hdfsFS <-RxHdfsFileSystem()
incomedata <- RxTextData(incomepath, fileSystem = hdfsFS, stringsAsFactors = TRUE)
#rxGetVarInfo(incomedata) # geeft foutmelding
rxGetVarNames(incomedata)


#Learn
incomeformula <- "AvgTemp ~ AvgMaxTemp + AvgMinTemp"
#incomeformula <- "AvgMaxTemp + AvgMinTemp"
model <- rxLinMod(formula = incomeformula, data = incomedata)
summary(model)

rxGetVarInfo(incomedata)
