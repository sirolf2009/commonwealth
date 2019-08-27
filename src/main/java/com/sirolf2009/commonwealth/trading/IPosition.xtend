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
		return getProfit(getExitPrice())
	}
	
	def getProfit(Number exit) {
		if(isLong()) {
			return (exit.doubleValue() - getEntryPrice().doubleValue()) * getSize().doubleValue() - getFees()
		} else {
			return (getEntryPrice().doubleValue() - exit.doubleValue()) * -getSize().doubleValue() - getFees()
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
	
	/** Expected to be negative when the positiontype is short */
	def getSize() {
		return getEntry().getAmount()
	}
	
}