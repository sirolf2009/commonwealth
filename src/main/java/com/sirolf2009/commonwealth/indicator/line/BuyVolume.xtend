package com.sirolf2009.commonwealth.indicator.line

import com.sirolf2009.commonwealth.ITick
import com.sirolf2009.commonwealth.trading.ITrade
import java.util.LinkedList
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor

@FinalFieldsConstructor class BuyVolume extends LineIndicator {
	
	val buffer = new LinkedList<ITrade>()
	val long perMillis
	
	override get(ITick tick) {
		tick.trades.forEach[addToBuffer]
		return buffer.filter[amount.doubleValue() > 0].map[amount.doubleValue()].reduce[a,b|a+b]
	}
	
	def private addToBuffer(ITrade trade) {
		buffer.add(trade)
		while(trade.point.x.longValue - buffer.peek().point.x.longValue > perMillis) {
			buffer.pop()
		}
	}
	
}