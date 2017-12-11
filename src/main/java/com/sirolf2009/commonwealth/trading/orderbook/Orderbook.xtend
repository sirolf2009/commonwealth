package com.sirolf2009.commonwealth.trading.orderbook

import java.util.Collection
import org.eclipse.xtend.lib.annotations.Data

@Data class Orderbook implements IOrderbook {
	
	val Collection<ILimitOrder> asks
	val Collection<ILimitOrder> bids
	
	new(Collection<ILimitOrder> asks, Collection<ILimitOrder> bids) {
		this.asks = asks.sortBy[price.doubleValue()].toSet()
		this.bids = bids.sortBy[price.doubleValue()].reverse().toSet()
		if(bids.size() > 0 && asks.size() > 0 && this.bids.get(0).price.doubleValue() > this.asks.get(0).price.doubleValue()) {
			throw new IllegalArgumentException("The best bid may not be higher than the best ask")
		}
	}
	
}