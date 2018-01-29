package com.sirolf2009.commonwealth.trading

import com.sirolf2009.commonwealth.timeseries.IPoint

interface ITrade {
	
	def IPoint getPoint()
	def Number getAmount()
	
	def getDate() {
		return getPoint().getDate()
	}
	
	def Number getPrice() {
		return getPoint().y.doubleValue()
	}
	
	def boolean bought() {
		return getAmount().doubleValue() > 0
	}
	
	def boolean sold() {
		return getAmount().doubleValue() < 0
	}
	
}