package com.sirolf2009.commonwealth.timeseries

import java.util.Date

interface IPoint {
	
	def Number getX()
	def Number getY()
	
	def getDate() {
		return new Date(getX().longValue())
	}
	
}