package com.sirolf2009.commonwealth.timeseries

import org.eclipse.xtend.lib.annotations.Data
import com.sirolf2009.util.GSonDTO
import java.io.Serializable
import java.util.Date

@Data @GSonDTO class Candlestick implements ICandlestick, Serializable {
	
	val Date timestamp
	val Number open
	val Number high
	val Number low
	val Number close
	
	new(Date timestamp, Number open, Number high, Number low, Number close) {
		this.timestamp = timestamp
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