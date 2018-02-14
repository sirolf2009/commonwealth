package com.sirolf2009.commonwealth.trading.orderbook

import com.sirolf2009.commonwealth.timeseries.IPoint
import com.sirolf2009.commonwealth.timeseries.Point
import com.sirolf2009.commonwealth.timeseries.Timeseries
import java.util.Collection
import java.util.Date

interface IOrderbook {
	
	def Date getTimestamp()
	def Collection<? extends ILimitOrder> getBids()
	def Collection<? extends ILimitOrder> getAsks()
	
	def createBidTimeseries() {
		return new Timeseries(getBids().map[new Point(price, getCumulativeBidAt(price.doubleValue())) as IPoint].toList())
	}
	
	def createAskTimeseries() {
		return new Timeseries(getAsks().map[new Point(price, getCumulativeAskAt(price.doubleValue())) as IPoint].toList())
	}
	
	def createMidTimeseries() {
		return new Timeseries((0 ..< Math.min(bids.size(), asks.size())).map[new Point(it, getMid(it)) as IPoint].toList())
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
	
	def getMid() {
		return getMid(0)
	}
	
	def getMid(int index) {
		return (getBids().get(index).price.doubleValue()+getAsks().get(index).price.doubleValue())/2
	}
	
}