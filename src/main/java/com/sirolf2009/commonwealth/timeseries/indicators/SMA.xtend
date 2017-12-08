package com.sirolf2009.commonwealth.timeseries.indicators

import com.sirolf2009.commonwealth.timeseries.ITimeseries
import java.util.function.Function
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor
import java.util.stream.IntStream
import com.sirolf2009.commonwealth.timeseries.IPoint
import com.sirolf2009.commonwealth.timeseries.Point
import com.sirolf2009.commonwealth.timeseries.Timeseries

@FinalFieldsConstructor class SMA implements Function<ITimeseries, ITimeseries> {
	
	val int period
	
	override apply(ITimeseries series) {
		return new Timeseries(series.map[new Point(x, series.sma(it).orElse(Double.NaN)) as IPoint].toList())
	}
	
	def sma(ITimeseries series, IPoint at) {
		return sma(series, at, period)
	}
	
	def static sma(ITimeseries series, IPoint at, int period) {
		return sma(series, series.toList().indexOf(at), period)
	}
	
	def sma(ITimeseries series, int index) {
		return sma(series, index, period)
	}
	
	def static sma(ITimeseries series, int index, int period) {
		return IntStream.rangeClosed(Math.max(0, index-period+1), index).mapToDouble[series.get(it).y.doubleValue()].average()
	}
	
}