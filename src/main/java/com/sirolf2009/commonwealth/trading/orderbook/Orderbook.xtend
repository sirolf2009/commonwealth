package com.sirolf2009.commonwealth.trading.orderbook

import java.util.Collection
import org.eclipse.xtend.lib.annotations.Data

@Data class Orderbook implements IOrderbook {
	
	val Collection<ILimitOrder> asks
	val Collection<ILimitOrder> bids
	
}