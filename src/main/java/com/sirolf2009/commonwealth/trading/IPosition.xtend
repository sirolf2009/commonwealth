package com.sirolf2009.commonwealth.trading

interface IPosition {
	
	def ITrade getEntry()
	def ITrade getExit()
	def Number getEntryFee()
	def Number getExitFee()
	def PositionType getPositionType()
	
	def isLong() {
		return positionType == PositionType.LONG
	}
	
	def isShort() {
		return positionType == PositionType.SHORT
	}
	
	def getProfit() {
		if(isLong()) {
			return getExit().getPrice().doubleValue() - getEntry().getPrice().doubleValue() - getFees()
		} else {
			return getEntry().getPrice().doubleValue() - getExit().getPrice().doubleValue() - getFees()
		}
	}
	
	def getFees() {
		return getEntryFee().doubleValue() + getExitFee().doubleValue()
	}
	
}