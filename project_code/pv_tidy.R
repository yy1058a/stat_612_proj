# load data and packages
library(readr)
library(tidyverse)
library(Stack)
library(svMisc)
library(compiler)

pv2010_1 <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Summary_for_2010__Weeks_1_to_26.csv")
pv2010_2 <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Summary_for_2010__Weeks_27_to_52.csv")

pv2011_1 <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Summary_for_2011__Weeks_1_to_26.csv")
pv2011_2 <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Summary_for_2011__Weeks_27_to_52.csv")

pv2012_1 <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Summary_for_2012__Weeks_1_to_26.csv")
pv2012_2 <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Summary_for_2012__Weeks_27_to_52.csv")

pv2013_1 <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Summary_for_2013__Weeks_1_to_26.csv")
pv2013_2 <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Summary_for_2013__Weeks_27_to_52.csv")

pv2014_1 <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Summary_for_2014__Weeks_1_to_26.csv")
pv2014_2 <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Summary_for_2014__Weeks_27_to_52.csv")

pv2015_1 <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Summary_for_2015__Weeks_1_to_26.csv")
pv2015_2 <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Summary_for_2015__Weeks_27_to_52.csv")

# check if column names are the same
my_func <- function(x,y) {
  for (i in names(x)) {
    if (!(i %in% names(y))) {
      print('Warning: Names are not the same')
      break
    }  
    else if(i==tail(names(y),n=1)) {
      print('Names are identical')
    }
  }
}

my_func(pv2010_1, pv2010_2)
my_func(pv2011_1, pv2011_2)
my_func(pv2012_1, pv2012_2)
my_func(pv2013_1, pv2013_2)
my_func(pv2014_1, pv2014_2)
my_func(pv2015_1, pv2015_2)

# stack years together
pv2010 <- Stack(pv2010_1, pv2010_2)
pv2011 <- Stack(pv2011_1, pv2011_2)
pv2012 <- Stack(pv2012_1, pv2012_2)
pv2013 <- Stack(pv2013_1, pv2013_2)
pv2014 <- Stack(pv2014_1, pv2014_2)
pv2015 <- Stack(pv2015_1, pv2015_2)

# add years column 
pv2010$year <- 2010
pv2011$year <- 2011
pv2012$year <- 2012
pv2013$year <- 2013
pv2014$year <- 2014
pv2015$year <- 2015

# check that columns are the same 
my_func(pv2010, pv2011)
my_func(pv2011, pv2012)
my_func(pv2012, pv2013)
my_func(pv2013, pv2014)
my_func(pv2014, pv2015)

# merge years together 
pv <- Stack(pv2010, pv2011)
pv <- Stack(pv, pv2012)
pv <- Stack(pv, pv2013)
pv <- Stack(pv, pv2014)
pv <- Stack(pv, pv2015)

# 2016 --------------------------------------------------------------------

# load 2016 data
pv2016_jan <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_January_2016.csv")
pv2016_feb <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_February_2016.csv")
pv2016_mar <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_March_2016.csv")
pv2016_apr <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_April_2016.csv")
pv2016_may <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_May_2016.csv")
pv2016_jun <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_June_2016.csv")
pv2016_jul <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_July_2016.csv")
pv2016_aug <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_August_2016.csv")
pv2016_sep <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_September_2016.csv")
pv2016_oct <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_October_2016.csv")
pv2016_nov <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_November_2016.csv")
pv2016_dec <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_December_2016.csv")

# check that columns are the same 
my_func(pv2016_jan, pv2016_feb)
my_func(pv2016_feb, pv2016_mar)
my_func(pv2016_mar, pv2016_apr)
my_func(pv2016_apr, pv2016_may)
my_func(pv2016_may, pv2016_jun)
my_func(pv2016_jun, pv2016_jul)
my_func(pv2016_jul, pv2016_aug)
my_func(pv2016_aug, pv2016_sep)
my_func(pv2016_sep, pv2016_oct)
my_func(pv2016_oct, pv2016_nov)
my_func(pv2016_nov, pv2016_dec)

# merge years together 
pv2016_1 <- Stack(pv2016_jan, pv2016_feb)
pv2016_2 <- Stack(pv2016_mar, pv2016_apr)
pv2016_3 <- Stack(pv2016_may, pv2016_jun)
pv2016_4 <- Stack(pv2016_jul, pv2016_aug)
pv2016_5 <- Stack(pv2016_sep, pv2016_oct)
pv2016_6 <- Stack(pv2016_nov, pv2016_dec)

pv2016 <- Stack(pv2016_1, pv2016_2)
pv2016 <- Stack(pv2016, pv2016_3)
pv2016 <- Stack(pv2016, pv2016_4)
pv2016 <- Stack(pv2016, pv2016_5)
pv2016 <- Stack(pv2016, pv2016_6)

# add year column 
pv2016$year <- 2016

# 2017 --------------------------------------------------------------------

# load 2017 data
pv2017_jan <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_January_2017.csv")
pv2017_feb <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_February_2017.csv")
pv2017_mar <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_March_2017.csv")
pv2017_apr <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_April_2017.csv")
pv2017_may <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_May_2017.csv")
pv2017_jun <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_June_2017.csv")
pv2017_jul <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_July_2017.csv")
pv2017_aug <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_August_2017.csv")
pv2017_sep <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_September_2017.csv")
pv2017_oct <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking Violations Issued in October 2017.csv")
pv2017_nov <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_November_2017.csv")
pv2017_dec <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_December_2017.csv")

# check that columns are the same 
my_func(pv2017_jan, pv2017_feb)
my_func(pv2017_feb, pv2017_mar)
my_func(pv2017_mar, pv2017_apr)
my_func(pv2017_apr, pv2017_may)
my_func(pv2017_may, pv2017_jun)
my_func(pv2017_jun, pv2017_jul)
my_func(pv2017_jul, pv2017_aug)
my_func(pv2017_aug, pv2017_sep)
my_func(pv2017_sep, pv2017_oct)
my_func(pv2017_oct, pv2017_nov)
my_func(pv2017_nov, pv2017_dec)

# merge years together 
pv2017_1 <- Stack(pv2017_jan, pv2017_feb)
pv2017_2 <- Stack(pv2017_mar, pv2017_apr)
pv2017_3 <- Stack(pv2017_may, pv2017_jun)
pv2017_4 <- Stack(pv2017_jul, pv2017_aug)
pv2017_5 <- Stack(pv2017_sep, pv2017_oct)
pv2017_6 <- Stack(pv2017_nov, pv2017_dec)

pv2017 <- Stack(pv2017_1, pv2017_2)
pv2017 <- Stack(pv2017, pv2017_3)
pv2017 <- Stack(pv2017, pv2017_4)
pv2017 <- Stack(pv2017, pv2017_5)
pv2017 <- Stack(pv2017, pv2017_6)

# add year column 
pv2017$year <- 2017

# 2018 --------------------------------------------------------------------

# load 2018 data
pv2018_jan <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_January_2018.csv")
pv2018_feb <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_February_2018.csv")
pv2018_mar <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_March_2018.csv")
pv2018_apr <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_April_2018.csv")
pv2018_may <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_May_2018.csv")
pv2018_jun <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_June_2018.csv")
pv2018_jul <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_July_2018.csv")
pv2018_aug <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_August_2018.csv")
pv2018_sep <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_September_2018.csv")
pv2018_oct <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_October_2018.csv")
pv2018_nov <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_November_2018.csv")
pv2018_dec <- read_csv("~/Downloads/stat_612_proj/raw_data/Parking_Violations_Issued_in_December_2018.csv")

# check that columns are the same 
my_func(pv2018_jan, pv2018_feb)
my_func(pv2018_feb, pv2018_mar)
my_func(pv2018_mar, pv2018_apr)
my_func(pv2018_apr, pv2018_may)
my_func(pv2018_may, pv2018_jun)
my_func(pv2018_jun, pv2018_jul)
my_func(pv2018_jul, pv2018_aug)
my_func(pv2018_aug, pv2018_sep)
my_func(pv2018_sep, pv2018_oct)
my_func(pv2018_oct, pv2018_nov)
my_func(pv2018_nov, pv2018_dec)

# merge years together 
pv2018_1 <- Stack(pv2018_jan, pv2018_feb)
pv2018_2 <- Stack(pv2018_mar, pv2018_apr)
pv2018_3 <- Stack(pv2018_may, pv2018_jun)
pv2018_4 <- Stack(pv2018_jul, pv2018_aug)
pv2018_5 <- Stack(pv2018_sep, pv2018_oct)
pv2018_6 <- Stack(pv2018_nov, pv2018_dec)

pv2018 <- Stack(pv2018_1, pv2018_2)
pv2018 <- Stack(pv2018, pv2018_3)
pv2018 <- Stack(pv2018, pv2018_4)
pv2018 <- Stack(pv2018, pv2018_5)
pv2018 <- Stack(pv2018, pv2018_6)

# add year column 
pv2018$year <- 2018


# Merge and Rename --------------------------------------------------------
my_func(pv2016, pv2017)
my_func(pv2018, pv2018)

pv2 <- NA
pv2 <- Stack(pv2016, pv2017)
pv2 <- Stack(pv2, pv2018)

my_func(pv, pv2)

# gather and separate columns
pv <- pv %>% 
  gather(COMMVEHICLE_AM_NORUSH:UNSAFEPARKING_PM_RUSH, 
         key = "type", value = "value")

pv <- pv %>% 
  filter(value > 0)

pv <- pv %>% 
  separate(type, c("violation_type", "time", "rush"), sep = "_")

# remove columns from pv 
cols.remove <- c("FROMADDRESSLEFTTHEO", "TOADDRESSLEFTTHEO", "SHAPE_",
                 "SHAPELEN")

pv <- pv[, ! names(pv) %in% cols.remove, drop = F]

# rename columns 
colnames(pv)

pv <- pv %>% 
  rename(object_id = OBJECTID,
         street_seg = STREETSEG,
         week_num = WEEKNUMBER,
         registered_name = REGISTEREDNAME,
         street_type = STREETTYPE,
         quadrant = QUADRANT)

# remove columns from pv2 
colnames(pv2)
cols.remove <- c("ISSUING_AGENCY_CODE", "VIOLATION_CODE", "PLATE_STATE",
                 "VEHICLE_TYPE", "MULTI_OWNER_NUMBER", "DISPOSITION_CODE",
                 "DISPOSITION_TYPE", "DISPOSITION_DESC", 
                 "DISPOSITION_DATE", "TOTAL_PAID", "PENALTY_1", 
                 "PENALTY_2", "PENALTY_3", "PENALTY_4", "PENALTY_5", 
                 "XCOORD", "YCOORD", "MAR_ID", "GIS_LAST_MOD_DTTM")

pv2 <- pv2[, ! names(pv2) %in% cols.remove, drop = F]

# drop unnecessary columns
cols.remove <- c("TICKET_NUMBER", "ISSUE_TIME", "ISSUING_AGENCY_CODE", "PLATE_STATE", "VEHICLE_TYPE", "MULTI_OWNER_NUMBER", "DISPOSITION_CODE", "DISPOSITION_TYPE", "DISPOSITION_DATE", "TOTAL_PAID", "PENALTY_1", "PENALTY_2", "PENALTY_3", "PENALTY_4", "PENALTY_5", "XCOORD", "YCOORD", "MAR_ID", "GIS_LAST_MOD_DTTM" )

pv2 <- pv2[, ! names(pv2) %in% cols.remove, drop = F]

# add formatted violation_type to pv2
unique(pv$violation_type)
pv2$violation_type <- NA

output <- character(nrow(pv2))

for (i in 1:nrow(pv2)) {
  if (str_detect(pv2$VIOLATION_PROC_DESC[i], "RUSH") == TRUE &
      (!is.na(pv2$VIOLATION_PROC_DESC[i]))) {
    output[i] <- "RUSHHOURVIOLATIONS"
    } else if (str_detect(pv2$VIOLATION_PROC_DESC[i], "BIKE") == TRUE &
               (!is.na(pv2$VIOLATION_PROC_DESC[i]))) {
      output[i] <- "IMPEDBIKEPED"
    } else if (str_detect(pv2$VIOLATION_PROC_DESC[i], "ZONE") == TRUE &
               (!is.na(pv2$VIOLATION_PROC_DESC[i]))) {
      output[i] <- "RESTRICTEDZONES"
    } else if (str_detect(pv2$VIOLATION_PROC_DESC[i], "METER") == TRUE &
               (!is.na(pv2$VIOLATION_PROC_DESC[i]))) {
      output[i] <- "METERS"
    } else if (str_detect(pv2$VIOLATION_PROC_DESC[i], "RESIDENT") == TRUE &
               (!is.na(pv2$VIOLATION_PROC_DESC[i]))) {
      output[i] <- "RPP"
    } else if (str_detect(pv2$VIOLATION_PROC_DESC[i], "COMM") == TRUE &
               (!is.na(pv2$VIOLATION_PROC_DESC[i]))) {
      output[i] <- "COMMVEHICLE"
    } else if (str_detect(pv2$VIOLATION_PROC_DESC[i], "PARK") == TRUE &
               (!is.na(pv2$VIOLATION_PROC_DESC[i]))) {
      output[i] <- "UNSAFEPARKING"
    } else {
      output[i] <- "OTHER"
    }
}

pv2$violation_type <- output

# add formatted time to pv2

output2 <- character(nrow(pv2))

for(i in 1:nrow(pv2)){
  if(str_detect(pv2$VIOLATION_PROC_DESC[i], " AM ") == TRUE &
     (!is.na(pv2$VIOLATION_PROC_DESC[i]))){
    output2[i] <- "AM"
  }else if(str_detect(pv2$VIOLATION_PROC_DESC[i], " PM ") == TRUE &
           (!is.na(pv2$VIOLATION_PROC_DESC[i]))){
    output2[i] <- "PM"
  }
}

pv2$time <- output2

# add formatted rush to pv2

output3 <- character(nrow(pv2))

for(i in 1:nrow(pv2)){
  if(str_detect(pv2$VIOLATION_PROC_DESC[i], "RUSH") == TRUE &
     (!is.na(pv2$VIOLATION_PROC_DESC[i]))){
    output3[i] <- "RUSH"
  }else {
    output3[i] <- "NORUSH"
  }
}

pv2$rush <- output3

# add value column 
pv2$value <- 1

# rename columns in pv2 
colnames(pv2)

pv2 <- pv2 %>% 
  rename(object_id = OBJECTID,
         issue_date = ISSUE_DATE,
         iss_agency_name = ISSUING_AGENCY_NAME, 
         iss_agency_short = ISSUING_AGENCY_SHORT, 
         violation_desc = VIOLATION_PROC_DESC, 
         location = LOCATION, 
         fine_amount = FINE_AMOUNT, 
         lat = LATITUDE, 
         lon = LONGITUDE)
  
# find which colnames are different 
x <- colnames(pv)
y <- colnames(pv2)

x[!x %in% y]
y[!y %in% x]

# combine street columns in location in pv 
pv <- pv %>% 
  unite("location", c(street_seg, registered_name, street_type, quadrant),
        sep = " ")

# merge pv and pv2 data frames
x[x %in% y]
pv_full <- Stack(pv, pv2)

nrow(pv) + nrow(pv2)
nrow(pv_full)

# break down pv_full into smaller files for uploading 
pv_full1 <- pv_full[1:1144730, ]
pv_full2 <- pv_full[1144731:2289460, ]
pv_full3 <- pv_full[2289461:3000000, ]
pv_full4 <- pv_full[3000001:3500000, ]
pv_full5 <- pv_full[3500001:4000000, ]
pv_full6 <- pv_full[4000001:4500000, ]
pv_full7 <- pv_full[4500001:5000000, ]
pv_full8 <- pv_full[5000001:5500000, ]
pv_full9 <- pv_full[5500001:6000000, ]
pv_full10 <- pv_full[6000001:6500000, ]
pv_full11 <- pv_full[6500001:6868383, ]

# export data 
write_csv(pv_full1, "pv1.csv")
write_csv(pv_full2, "pv2.csv")
write_csv(pv_full3, "pv3.csv")
write_csv(pv_full4, "pv4.csv")
write_csv(pv_full5, "pv5.csv")
write_csv(pv_full6, "pv6.csv")
write_csv(pv_full7, "pv7.csv")
write_csv(pv_full8, "pv8.csv")
write_csv(pv_full9, "pv9.csv")
write_csv(pv_full10, "pv10.csv")
write_csv(pv_full11, "pv11.csv")





