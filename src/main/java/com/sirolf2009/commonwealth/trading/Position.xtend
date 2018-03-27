package com.sirolf2009.commonwealth.trading

import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Data

@Data class Position implements IPosition, Serializable {
	
	val ITrade entry
	val ITrade exit
	val Number entryFee
	val Number exitFee
	val PositionType positionType
	
	new(ITrade entry, Number entryFee, ITrade exit, Number exitFee) {
		this(entry, entryFee, exit, exitFee, if(entry.bought()) PositionType.LONG else PositionType.SHORT)
	}
	
	new(ITrade entry, Number entryFee, ITrade exit, Number exitFee, PositionType positionType) {
		this.entry = entry
		this.entryFee = entryFee
		this.exit = exit
		this.exitFee = exitFee
		this.positionType = positionType
	}
	
}