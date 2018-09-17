package com.sirolf2009.commonwealth.timeseries

import java.util.ArrayList
import java.util.Collection
import java.util.List
import java.util.Date

interface ITimeseries extends Collection<IPoint> {
	
	def candlesticks(int intervalLength) {
		if(isEmpty()) {
			return new CandlestickSeries(#[])
		}
		val List<ICandlestick> candlesticks = new ArrayList()
		var double open = Double.NaN
		var double high = Double.MIN_VALUE
		var double low = Double.MAX_VALUE
		var double close = Double.NaN
		var Date currentStart = null
		for(point : this) {
			if(currentStart === null) {
				currentStart = point.getDate()
				open = point.getY().doubleValue()
				high = point.getY().doubleValue()
				low = point.getY().doubleValue()
				close = point.getY().doubleValue()
			} else if(point.getDate().getTime() - currentStart.getTime() > intervalLength) {
				candlesticks.add(new Candlestick(currentStart, open, high, low, close))
				currentStart = point.getDate()
				open = point.getY().doubleValue()
				high = point.getY().doubleValue()
				low = point.getY().doubleValue()
				close = point.getY().doubleValue()
			} else {
				high = Math.max(open, point.getY().doubleValue())
				low = Math.min(low, point.getY().doubleValue())
				close = point.getY().doubleValue()
			}
		}
		return new CandlestickSeries(candlesticks)
	}
	
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