print("Generating Plot 3...")
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

png(filename = 'plot3.png', width = 480, height = 480)
with(my.table, plot(DateTime, Sub_metering_1, main = '', type = 'n', xlab = '', ylab = 'Energy sub metering'))
lines(my.table$DateTime, my.table$Sub_metering_1, col = "black")
lines(my.table$DateTime, my.table$Sub_metering_3, col = "blue")
lines(my.table$DateTime, my.table$Sub_metering_2, col = "red")
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 2)
dev.off()

print("Done!")