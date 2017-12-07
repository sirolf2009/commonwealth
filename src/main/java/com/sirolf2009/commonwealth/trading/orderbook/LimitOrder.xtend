package com.sirolf2009.commonwealth.trading.orderbook

import org.eclipse.xtend.lib.annotations.Data

@Data class LimitOrder implements ILimitOrder {
	
	val Number price
	val Number amount
	
}