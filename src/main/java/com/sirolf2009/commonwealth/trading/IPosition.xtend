package com.sirolf2009.commonwealth.trading

import java.io.Serializable

interface IPosition extends Serializable {
	
	def ITrade getEntry()
	def ITrade getExit()
	def Number getEntryFee()
	def Number getExitFee()
	def Number getMaxDrawdown()
	def Number getMaxDrawup()
	def PositionType getPositionType()
	
	def getProfitPercentage() {
		return getProfit() / (getEntryPrice().doubleValue() * Math.abs(getSize().doubleValue())) * 100
	}
	
	def getProfit() {
		if(isLong()) {
			return (getExitPrice().doubleValue() - getEntryPrice().doubleValue()) * getSize().doubleValue() - getFees()
		} else {
			return (getEntryPrice().doubleValue() - getExitPrice().doubleValue()) * -getSize().doubleValue() - getFees()
		}
	}
	
	def isLong() {
		return positionType == PositionType.LONG
	}
	
	def isShort() {
		return positionType == PositionType.SHORT
	}
	
	def getFees() {
		return getEntryFee().doubleValue() + getExitFee().doubleValue()
	}
	
	def getEntryPrice() {
		return getEntry().getPrice()
	}
	
	def getExitPrice() {
		return getExit().getPrice()
	}
	
	def getSize() {
		return getEntry().getAmount()
	}
	
}