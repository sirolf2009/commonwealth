package com.sirolf2009.commonwealth.indicator.line

import com.sirolf2009.commonwealth.timeseries.IPoint
import com.sirolf2009.commonwealth.timeseries.ITimeseries
import com.sirolf2009.commonwealth.timeseries.Point
import com.sirolf2009.commonwealth.timeseries.Timeseries
import com.sirolf2009.commonwealth.trading.ITrade
import com.sirolf2009.commonwealth.trading.orderbook.ILimitOrder
import com.sirolf2009.commonwealth.trading.orderbook.IOrderbook
import com.sirolf2009.commonwealth.trading.orderbook.LimitOrder
import com.sirolf2009.commonwealth.trading.orderbook.Orderbook
import java.util.Collection
import java.util.Date
import java.util.List
import java.util.concurrent.atomic.AtomicLong
import com.sirolf2009.commonwealth.trading.Trade
import com.sirolf2009.commonwealth.ITick
import com.sirolf2009.commonwealth.Tick

class IndicatorTestExtensions {
	
	def static ITick tick(List<ITrade> trades) {
		return tick(orderbook(#[], #[]), trades)
	}
	
	def static ITick tick(IOrderbook orderbook) {
		return tick(orderbook, #[])
	}
	
	def static ITick tick(IOrderbook orderbook, List<ITrade> trades) {
		tick(new Date(), orderbook, trades)
	}
	
	def static ITick tick(Date timestamp, IOrderbook orderbook, List<ITrade> trades) {
		return new Tick(timestamp, orderbook, trades)
	}
	
	def static ITrade trade(long when, double price) {
		return trade(when, price, 1)
	}
	
	def static ITrade trade(long when, double price, double amount) {
		return new Trade(point(when, price), amount)
	}
	
	def static ITimeseries timeseries(Double...doubles) {
		return new Timeseries(doubles.points())
	}
	
	def static List<IPoint> points(Double... doubles) {
		val counter = new AtomicLong()
		return doubles.map[
			val index = counter.getAndIncrement()
			return point(index, it)
		]
	}
	
	def static IPoint point(Number x, Number y) {
		return new Point(x, y) as IPoint
	}
	
	def static IOrderbook orderbook(double bid, double bidAmount, double ask, double askAmount) {
		return new Orderbook(new Date(), #[order(bid, bidAmount)], #[order(ask, askAmount)])
	}
	
	def static IOrderbook orderbook(double bid, double ask) {
		return new Orderbook(new Date(), #[order(ask)], #[order(bid)])
	}
	
	def static IOrderbook orderbook(Collection<ILimitOrder> bids, Collection<ILimitOrder> asks) {
		return new Orderbook(new Date(), asks, bids)
	}
	
	def static order(double price) {
		return order(price, 1)
	}
	
	def static ILimitOrder order(double price, double amount) {
		return new LimitOrder(price, amount)
	}
	
}
