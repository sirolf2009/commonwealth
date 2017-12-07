package com.sirolf2009.commonwealth.timeseries.trends

import com.sirolf2009.commonwealth.timeseries.IPoint

interface IExtreme {
	
	def IPoint getPoint()
	def ExtremeType getExtremeType()
}