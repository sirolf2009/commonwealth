package com.sirolf2009.commonwealth.timeseries.indicators

import com.sirolf2009.commonwealth.timeseries.ITimeseries
import com.sirolf2009.commonwealth.trading.orderbook.IOrderbook
import java.util.List
import java.util.function.Function
import com.sirolf2009.commonwealth.timeseries.Timeseries
import com.sirolf2009.commonwealth.timeseries.Point
import com.sirolf2009.commonwealth.timeseries.IPoint

class AskSum implements Function<List<IOrderbook>, ITimeseries> {
	
	override apply(List<IOrderbook> orderbooks) {
		return new Timeseries(orderbooks.map[new Point(orderbooks.indexOf(it), askSum) as IPoint].toList())
	}
	
	def static askSum(IOrderbook orderbook) {
		return orderbook.asks.map[amount.doubleValue()].reduce[a,b|a+b]
	}
	
}