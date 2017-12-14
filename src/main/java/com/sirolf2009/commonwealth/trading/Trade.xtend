package com.sirolf2009.commonwealth.trading

import com.sirolf2009.commonwealth.timeseries.IPoint
import org.eclipse.xtend.lib.annotations.Data

@Data class Trade implements ITrade {
	
	val IPoint point
	val Number amount
	
}