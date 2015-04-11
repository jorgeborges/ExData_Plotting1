print("Generating Plot 4...")
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

png(filename = 'plot4.png', width = 480, height = 480)
par(mfrow = c(2, 2))
with(my.table, plot(DateTime, Global_active_power, main = '', type = 'n', xlab = '', ylab = 'Global Active Power (kilowatts)'))
lines(my.table$DateTime, my.table$Global_active_power, col = "black")

with(my.table, plot(DateTime, Voltage, main = '', type = 'n', xlab = 'datetime', ylab = 'Voltage'))
lines(my.table$DateTime, my.table$Voltage, col = "black")

with(my.table, plot(DateTime, Sub_metering_1, main = '', type = 'n', xlab = '', ylab = 'Energy sub metering'))
lines(my.table$DateTime, my.table$Sub_metering_1, col = "black")
lines(my.table$DateTime, my.table$Sub_metering_3, col = "blue")
lines(my.table$DateTime, my.table$Sub_metering_2, col = "red")
legend('topright', bty = 'n', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 2)

with(my.table, plot(DateTime, Global_reactive_power, main = '', type = 'n', xlab = 'datetime', ylab = 'Global_reactive_power'))
lines(my.table$DateTime, my.table$Global_reactive_power, col = "black")
dev.off()

print("Done!")