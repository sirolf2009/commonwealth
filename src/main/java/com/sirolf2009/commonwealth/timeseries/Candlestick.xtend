package com.sirolf2009.commonwealth.timeseries

import org.eclipse.xtend.lib.annotations.Data
import com.sirolf2009.util.GSonDTO
import java.io.Serializable

@Data @GSonDTO class Candlestick implements ICandlestick, Serializable {
	
	val Number open
	val Number high
	val Number low
	val Number close
	
	new(Number open, Number high, Number low, Number close) {
		this.open = open
		this.high = high
		this.low = low
		this.close = close
		if(open.doubleValue() < low.doubleValue()) {
			throw new IllegalArgumentException("The open cannot be lower than the low")
		}
		if(high.doubleValue() < low.doubleValue()) {
			throw new IllegalArgumentException("The high cannot be lower than the low")
		}
		if(close.doubleValue() < low.doubleValue()) {
			throw new IllegalArgumentException("The high cannot be lower than the low")
		}
		if(open.doubleValue() > high.doubleValue()) {
			throw new IllegalArgumentException("The open cannot be higher than the high")
		}
		if(high.doubleValue() > high.doubleValue()) {
			throw new IllegalArgumentException("The high cannot be higher than the high")
		}
		if(close.doubleValue() > high.doubleValue()) {
			throw new IllegalArgumentException("The high cannot be higher than the high")
		}
	}
	
}