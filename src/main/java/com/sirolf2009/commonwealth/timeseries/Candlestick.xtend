package com.sirolf2009.commonwealth.timeseries

import org.eclipse.xtend.lib.annotations.Data

@Data class Candlestick implements ICandlestick {
	
	val Number open
	val Number high
	val Number low
	val Number close
	
}