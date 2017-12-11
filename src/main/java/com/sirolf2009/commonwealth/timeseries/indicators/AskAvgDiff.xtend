package com.sirolf2009.commonwealth.timeseries.indicators

import com.sirolf2009.commonwealth.timeseries.IPoint
import com.sirolf2009.commonwealth.timeseries.ITimeseries
import com.sirolf2009.commonwealth.timeseries.Point
import com.sirolf2009.commonwealth.timeseries.Timeseries
import com.sirolf2009.commonwealth.trading.orderbook.IOrderbook
import java.util.List
import java.util.function.Function
import java.util.stream.IntStream

class AskAvgDiff implements Function<List<IOrderbook>, ITimeseries> {

	override apply(List<IOrderbook> orderbooks) {
		return new Timeseries(orderbooks.map [
			new Point(orderbooks.indexOf(it), askAvgDiff.orElse(Double.NaN)) as IPoint
		].toList())
	}

	def static askAvgDiff(IOrderbook orderbook) {
		return IntStream.range(0, orderbook.asks.size() - 1).mapToDouble [ i |
			orderbook.asks.get(i + 1).price.doubleValue() - orderbook.asks.get(i).price.doubleValue()
		].average()
	}

}
