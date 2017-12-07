package com.sirolf2009.commonwealth.trading.orderbook

import java.util.Collection
import com.sirolf2009.commonwealth.timeseries.Point
import com.sirolf2009.commonwealth.timeseries.Timeseries
import com.sirolf2009.commonwealth.timeseries.IPoint

interface IOrderbook {
	
	def Collection<ILimitOrder> getBids()
	def Collection<ILimitOrder> getAsks()
	
	def createBidTimeseries() {
		return new Timeseries(getBids().map[new Point(price, getCumulativeBidAt(price.doubleValue())) as IPoint].toList())
	}
	
	def createAskTimeseries() {
		return new Timeseries(getAsks().map[new Point(price, getCumulativeAskAt(price.doubleValue())) as IPoint].toList())
	}
	
	def getCumulativeBidAt(double atPrice) {
		return getBids().filter[price.doubleValue() >= atPrice].map[amount.doubleValue()].reduce[a,b|a+b]
	}
	
	def getCumulativeAskAt(double atPrice) {
		return getAsks().filter[price.doubleValue() <= atPrice].map[amount.doubleValue()].reduce[a,b|a+b]
	}
	
	def sumBid() {
		return getBids().map[amount.doubleValue()].reduce[a,b|a+b]
	}
	
	def sumAsk() {
		return getAsks().map[amount.doubleValue()].reduce[a,b|a+b]
	}
	
}