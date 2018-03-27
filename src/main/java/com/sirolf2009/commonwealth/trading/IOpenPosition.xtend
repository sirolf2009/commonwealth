package com.sirolf2009.commonwealth.trading

import java.io.Serializable

interface IOpenPosition extends Serializable {
	
	def ITrade getEntry()
	def Number getEntryFee()
	def PositionType getPositionType()
	
	def double getProfitPercentage(Number bid, Number ask) {
		if(isLong()) {
			return getProfit(ask)
		} else {
			return getProfit(bid)
		}
	}
	
	def getProfitPercentage(Number currentPrice) {
		return getProfit(currentPrice) / (getEntryPrice().doubleValue() * Math.abs(getSize().doubleValue())) * 100
	}
	
	def double getProfit(Number bid, Number ask) {
		if(isLong()) {
			return getProfit(ask)
		} else {
			return getProfit(bid)
		}
	}
	
	def getProfit(Number currentPrice) {
		if(isLong()) {
			return (currentPrice.doubleValue() - getEntryPrice().doubleValue()) * getSize().doubleValue() - getEntryFee()
		} else {
			return (getEntryPrice().doubleValue() - currentPrice.doubleValue()) * -getSize().doubleValue() - getEntryFee()
		}
	}
	
	def isLong() {
		return positionType == PositionType.LONG
	}
	
	def isShort() {
		return positionType == PositionType.SHORT
	}
	
	def getEntryPrice() {
		return getEntry().getPrice()
	}
	
	def getSize() {
		return getEntry().getAmount()
	}
	
}