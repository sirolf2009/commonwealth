package com.sirolf2009.commonwealth.indicator.line

import com.sirolf2009.commonwealth.ITick

class SellVolume extends LineIndicator {
	
	override get(ITick tick) {
		return tick.trades.stream.filter[amount.doubleValue() < 0].map[-amount.doubleValue()].reduce[a,b|a+b].orElse(0d)
	}
	
	override copy() {
		return new SellVolume()
	}
	
}