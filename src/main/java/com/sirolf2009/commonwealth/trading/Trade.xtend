package com.sirolf2009.commonwealth.trading

import com.sirolf2009.commonwealth.timeseries.Point
import org.eclipse.xtend.lib.annotations.Data

@Data class Trade implements ITrade {
	
	val Point point
	val Number amount
	
}