package com.sirolf2009.commonwealth.timeseries

import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Data

@Data class Point implements IPoint, Serializable {
	
	val Number x
	val Number y
	
}