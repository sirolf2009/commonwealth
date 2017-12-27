package com.sirolf2009.commonwealth.indicator.line

import com.sirolf2009.commonwealth.ITick
import com.sirolf2009.commonwealth.trading.orderbook.IOrderbook

class AskSum extends LineIndicator {
	
	override get(ITick tick) {
		return tick.orderbook.askSum()
	}
	
	def static askSum(IOrderbook orderbook) {
		return orderbook.asks.map[amount.doubleValue()].reduce[a,b|a+b]
	}
	
	override copy() {
		return new AskSum()
	}
	
}