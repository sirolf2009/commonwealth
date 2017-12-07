package com.sirolf2009.commonwealth.trading

interface IPosition {
	
	def ITrade getEntry()
	def ITrade getExit()
	def Number getEntryFee()
	def Number getExitFee()
	def PositionType getPositionType()
	
	def getProfit() {
		if(positionType == PositionType.LONG) {
			return getExit().point.y.doubleValue() - getEntry().point.y.doubleValue() - getFees()
		} else {
			return getEntry().point.y.doubleValue() - getExit().point.y.doubleValue() - getFees()
		}
	}
	
	def getFees() {
		return getEntryFee().doubleValue() + getExitFee().doubleValue()
	}
	
}