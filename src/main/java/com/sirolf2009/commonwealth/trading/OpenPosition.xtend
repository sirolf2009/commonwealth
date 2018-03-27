package com.sirolf2009.commonwealth.trading

import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Data

@Data class OpenPosition implements IOpenPosition, Serializable {
	
	val ITrade entry
	val Number entryFee
	val PositionType positionType
	
	new(ITrade entry, Number entryFee) {
		this(entry, entryFee, if(entry.bought()) PositionType.LONG else PositionType.SHORT)
	}
	
	new(ITrade entry, Number entryFee, PositionType positionType) {
		this.entry = entry
		this.entryFee = entryFee
		this.positionType = positionType
	}
	
}