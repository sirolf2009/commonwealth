package com.sirolf2009.commonwealth.trading

import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Data

@Data class OpenPosition implements IOpenPosition, Serializable {
	
	val ITrade entry
	val Number entryFee
	val Number maxDrawdown
	val Number maxDrawup
	val PositionType positionType
	
	new(ITrade entry, Number entryFee, Number maxDrawdown, Number maxDrawup) {
		this(entry, entryFee, maxDrawdown, maxDrawup, if(entry.bought()) PositionType.LONG else PositionType.SHORT)
	}
	
	new(ITrade entry, Number entryFee, Number maxDrawdown, Number maxDrawup, PositionType positionType) {
		this.entry = entry
		this.entryFee = entryFee
		this.maxDrawdown = maxDrawdown
		this.maxDrawup = maxDrawup
		this.positionType = positionType
	}
	
}