package com.sirolf2009.commonwealth.trading

import org.eclipse.xtend.lib.annotations.Data

@Data class Position implements IPosition {
	
	val ITrade entry
	val ITrade exit
	val Number entryFee
	val Number exitFee
	val PositionType positionType
	
}