package com.sirolf2009.commonwealth.timeseries.trends

import com.sirolf2009.commonwealth.timeseries.IPoint
import org.eclipse.xtend.lib.annotations.Data

@Data class Extreme implements IExtreme {
	
	val IPoint point
	val ExtremeType extremeType
	
}