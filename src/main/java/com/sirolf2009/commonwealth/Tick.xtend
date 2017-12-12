package com.sirolf2009.commonwealth

import com.sirolf2009.commonwealth.trading.ITrade
import com.sirolf2009.commonwealth.trading.orderbook.IOrderbook
import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Data

@Data class Tick implements ITick {
	
	val Date timestamp
	val IOrderbook orderbook
	val List<ITrade> trades
	
}