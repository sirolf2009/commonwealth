package com.sirolf2009.commonwealth.trading

import com.sirolf2009.util.GSonDTO
import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Data

@Data @GSonDTO class Position implements IPosition, Serializable {
	
	val ITrade entry
	val ITrade exit
	val Number entryFee
	val Number exitFee
	val PositionType positionType
	
}