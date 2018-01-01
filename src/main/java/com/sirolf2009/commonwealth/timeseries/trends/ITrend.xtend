package com.sirolf2009.commonwealth.timeseries.trends

import com.sirolf2009.commonwealth.timeseries.IPoint

interface ITrend {
	
	def IPoint getFrom()
	def IPoint getTo()
	
}