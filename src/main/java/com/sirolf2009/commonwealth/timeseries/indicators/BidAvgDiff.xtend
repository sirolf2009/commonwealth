package com.sirolf2009.commonwealth.timeseries.indicators

import com.sirolf2009.commonwealth.timeseries.IPoint
import com.sirolf2009.commonwealth.timeseries.ITimeseries
import com.sirolf2009.commonwealth.timeseries.Point
import com.sirolf2009.commonwealth.timeseries.Timeseries
import com.sirolf2009.commonwealth.trading.orderbook.IOrderbook
import java.util.List
import java.util.function.Function
import java.util.stream.IntStream

class BidAvgDiff implements Function<List<IOrderbook>, ITimeseries> {

	override apply(List<IOrderbook> orderbooks) {
		return new Timeseries(orderbooks.map [
			new Point(orderbooks.indexOf(it), bidAvgDiff.orElse(Double.NaN)) as IPoint
		].toList())
	}

	def static bidAvgDiff(IOrderbook orderbook) {
		return IntStream.range(0, orderbook.bids.size() - 1).mapToDouble [ i |
			orderbook.bids.get(i).price.doubleValue() - orderbook.bids.get(i + 1).price.doubleValue()
		].average()
	}

}
