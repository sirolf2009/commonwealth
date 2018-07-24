package com.sirolf2009.commonwealth.trading

import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Data

@Data class Position implements IPosition, Serializable {
	
	val ITrade entry
	val ITrade exit
	val Number entryFee
	val Number exitFee
	val Number maxDrawdown
	val Number maxDrawup
	val PositionType positionType
	
	new(ITrade entry, Number entryFee, ITrade exit, Number exitFee, Number maxDrawdown, Number maxDrawup) {
		this(entry, entryFee, exit, exitFee, maxDrawdown, maxDrawup, if(entry.bought()) PositionType.LONG else PositionType.SHORT)
	}
	
	new(ITrade entry, Number entryFee, ITrade exit, Number exitFee, Number maxDrawdown, Number maxDrawup, PositionType positionType) {
		this.entry = entry
		this.entryFee = entryFee
		this.exit = exit
		this.exitFee = exitFee
		this.maxDrawdown = maxDrawdown
		this.maxDrawup = maxDrawup
		this.positionType = positionType
	}
	
}