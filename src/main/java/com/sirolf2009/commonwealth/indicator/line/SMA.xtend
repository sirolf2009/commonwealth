package com.sirolf2009.commonwealth.indicator.line

import com.sirolf2009.commonwealth.ITick
import com.sirolf2009.commonwealth.timeseries.IPoint
import java.util.LinkedList
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor

@FinalFieldsConstructor class SMA extends LineIndicator {
	
	val buffer = new LinkedList<IPoint>()
	val int period
	val ILineIndicator indicator
	
	override get(ITick tick) {
		buffer.add(indicator.apply(tick))
		while(buffer.size() > period) {
			buffer.pop()
		}
		return buffer.stream.mapToDouble[y.doubleValue()].average().orElse(Double.NaN)
	}
	
	override copy() {
		return new SMA(period, indicator)
	}
	
}