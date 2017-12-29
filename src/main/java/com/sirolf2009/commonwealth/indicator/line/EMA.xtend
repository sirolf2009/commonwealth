package com.sirolf2009.commonwealth.indicator.line

import com.sirolf2009.commonwealth.ITick
import com.sirolf2009.commonwealth.timeseries.IPoint
import java.util.LinkedList
import java.util.concurrent.atomic.AtomicReference

class EMA extends LineIndicator {
	
	val int period
	val ILineIndicator indicator
	val previousEma = new AtomicReference<Double>()
	val buffer = new LinkedList<IPoint>()
	val Double multiplier
	
	new(int period, ILineIndicator indicator) {
		this.period = period
		this.indicator = indicator
		this.multiplier = 2d/(period+1d)
	}
	
	override get(ITick tick) {
		buffer.add(indicator.apply(tick))
		if(buffer.size() > period) {
			buffer.pop()
		}
		if(previousEma.get() === null && buffer.size() == period) {
			val value = buffer.stream.mapToDouble[y.doubleValue].average.orElse(Double.NaN)
			previousEma.set(value)
			return value
		} else if(previousEma.get() !== null) {
			val value = (buffer.last.y.doubleValue - previousEma.get()) * multiplier + previousEma.get()
			previousEma.set(value)
			return value 
		}
		return Double.NaN
	}
	
	override copy() {
		return new EMA(period, indicator)
	}
	
}