package com.sirolf2009.commonwealth.trading

import com.sirolf2009.commonwealth.timeseries.Point

interface ITrade {
	
	def Point getPoint()
	def Number getAmount()
	
	def Number getPrice() {
		return getPoint().y.doubleValue()
	}
	
}