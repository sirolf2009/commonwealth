package com.sirolf2009.commonwealth.indicator.line

import com.sirolf2009.commonwealth.ITick
import com.sirolf2009.commonwealth.trading.orderbook.IOrderbook

class BidSum extends LineIndicator {
	
	override get(ITick tick) {
		return tick.orderbook.bidSum()
	}
	
	def static bidSum(IOrderbook orderbook) {
		return orderbook.bids.map[amount.doubleValue()].reduce[a,b|a+b]
	}
	
	override copy() {
		return new BidSum()
	}
	
}
