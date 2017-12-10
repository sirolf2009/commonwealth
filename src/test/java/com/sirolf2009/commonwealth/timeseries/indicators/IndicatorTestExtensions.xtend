package com.sirolf2009.commonwealth.timeseries.indicators

import com.sirolf2009.commonwealth.timeseries.IPoint
import com.sirolf2009.commonwealth.timeseries.Point
import com.sirolf2009.commonwealth.timeseries.Timeseries
import java.util.List
import com.sirolf2009.commonwealth.timeseries.ITimeseries
import com.sirolf2009.commonwealth.trading.orderbook.IOrderbook
import com.sirolf2009.commonwealth.trading.orderbook.Orderbook
import com.sirolf2009.commonwealth.trading.orderbook.LimitOrder
import com.sirolf2009.commonwealth.trading.orderbook.ILimitOrder

class IndicatorTestExtensions {
	
	def static ITimeseries timeseries(Double... doubles) {
		return new Timeseries(doubles.points())
	}
	
	def static List<IPoint> points(Double... doubles) {
		return doubles.map[
			new Point(doubles.indexOf(it), it) as IPoint
		]
	}
	
	def static IOrderbook orderbook(double bid, double bidAmount, double ask, double askAmount) {
		return new Orderbook(#[order(bid, bidAmount)], #[order(ask, askAmount)])
	}
	
	def static IOrderbook orderbook(double bid, double ask) {
		return new Orderbook(#[order(ask)], #[order(bid)])
	}
	
	def static order(double price) {
		return order(price, 1)
	}
	
	def static ILimitOrder order(double price, double amount) {
		return new LimitOrder(price, amount)
	}
	
	
}