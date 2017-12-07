package com.sirolf2009.commonwealth.timeseries

import java.util.Collection

interface ITimeseries extends Collection<IPoint> {
	
	def sum() {
		return getY().map[doubleValue()].reduce[a,b|a+b]
	}
	
	def getX() {
		return map[x]
	}
	
	def getY() {
		return map[y]
	}
	
}