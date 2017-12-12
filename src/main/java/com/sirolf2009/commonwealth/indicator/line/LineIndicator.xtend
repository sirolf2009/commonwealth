package com.sirolf2009.commonwealth.indicator.line

import com.sirolf2009.commonwealth.ITick
import com.sirolf2009.commonwealth.timeseries.ITimeseries
import com.sirolf2009.commonwealth.timeseries.Point
import com.sirolf2009.commonwealth.timeseries.Timeseries
import java.util.List

abstract class LineIndicator implements ILineIndicator {
	
	def ITimeseries apply(List<ITick> ticks) {
		return new Timeseries(ticks.map[apply].toList())
	}
	
	override apply(ITick t) {
		return new Point(t.timestamp.time, get(t))
	}
	
	def double get(ITick tick)
	
}