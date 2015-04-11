print("Generating Plot 1...")
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

png(filename = 'plot1.png', width = 480, height = 480)
with(my.table, hist(Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)'))
dev.off()

print("Done!")