package com.sirolf2009.commonwealth.indicator.line

import com.sirolf2009.commonwealth.ITick
import com.sirolf2009.commonwealth.trading.orderbook.IOrderbook

class Spread extends LineIndicator {

	override get(ITick tick) {
		return tick.orderbook.spread()
	}
	
	def static spread(IOrderbook orderbook) {
		return orderbook.asks.get(0).price.doubleValue() - orderbook.bids.get(0).price.doubleValue()
	}
	
}
