print("Generating Plot 2...")
my.table <- read.table(
  file = 'household_power_consumption.txt',
  header = T,
  sep = ';',
  na.strings = '?',
  strip.white = T,
  colClasses =
    c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
my.table$Date = as.Date(my.table$Date, format = '%d/%m/%Y')
my.table <- my.table[my.table$Date %in% as.Date(c('2007-02-01', '2007-02-02')), ]
my.table$DateTime <- as.POSIXct(strptime(paste(my.table$Date, my.table$Time), "%Y-%m-%d %H:%M:%S"))

png(filename = 'plot2.png', width = 480, height = 480)
with(my.table, plot(DateTime, Global_active_power, main = '', type = 'n', xlab = '', ylab = 'Global Active Power (kilowatts)'))
lines(my.table$DateTime, my.table$Global_active_power, col = "black")
dev.off()

print("Done!")