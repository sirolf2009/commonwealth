package com.sirolf2009.commonwealth.timeseries.trends

import com.sirolf2009.commonwealth.timeseries.IPoint
import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Data

@Data class Extreme implements IExtreme, Serializable {
	
	val IPoint point
	val ExtremeType extremeType
	
}