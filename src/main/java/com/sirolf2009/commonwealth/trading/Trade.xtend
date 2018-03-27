package com.sirolf2009.commonwealth.trading

import com.sirolf2009.commonwealth.timeseries.IPoint
import com.sirolf2009.commonwealth.timeseries.Point
import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Data

@Data class Trade implements ITrade, Serializable {
	
	val IPoint point
	val Number amount
	
	new(Number time, Number price, Number amount) {
		this(new Point(time, price), amount)
	}
	
	new(IPoint point, Number amount) {
		this.point = point
		this.amount = amount
	}
	
}