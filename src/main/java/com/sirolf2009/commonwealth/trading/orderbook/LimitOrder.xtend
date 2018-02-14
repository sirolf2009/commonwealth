package com.sirolf2009.commonwealth.trading.orderbook

import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Data

@Data class LimitOrder implements ILimitOrder, Serializable {
	
	val Number price
	val Number amount
	
}