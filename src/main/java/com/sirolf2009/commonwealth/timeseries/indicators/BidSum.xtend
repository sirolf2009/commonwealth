package com.sirolf2009.commonwealth.timeseries.indicators

import com.sirolf2009.commonwealth.timeseries.ITimeseries
import com.sirolf2009.commonwealth.trading.orderbook.IOrderbook
import java.util.List
import java.util.function.Function
import com.sirolf2009.commonwealth.timeseries.Timeseries
import com.sirolf2009.commonwealth.timeseries.Point
import com.sirolf2009.commonwealth.timeseries.IPoint

class BidSum implements Function<List<IOrderbook>, ITimeseries> {
	
	override apply(List<IOrderbook> orderbooks) {
		return new Timeseries(orderbooks.map[new Point(orderbooks.indexOf(it), bidSum) as IPoint].toList())
	}
	
	def static bidSum(IOrderbook orderbook) {
		return orderbook.bids.map[amount.doubleValue()].reduce[a,b|a+b]
	}
	
}