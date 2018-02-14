package com.sirolf2009.commonwealth

import com.sirolf2009.commonwealth.trading.ITrade
import com.sirolf2009.commonwealth.trading.orderbook.IOrderbook
import java.util.Date
import java.util.List

interface ITick {
	
	def Date getTimestamp()
	def IOrderbook getOrderbook()
	def List<? extends ITrade> getTrades()
	
}