package com.sirolf2009.commonwealth.trading.orderbook

import org.eclipse.xtend.lib.annotations.Data
import com.sirolf2009.util.GSonDTO
import java.io.Serializable

@Data @GSonDTO class LimitOrder implements ILimitOrder, Serializable {
	
	val Number price
	val Number amount
	
}