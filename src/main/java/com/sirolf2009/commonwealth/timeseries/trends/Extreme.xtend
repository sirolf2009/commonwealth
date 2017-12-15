package com.sirolf2009.commonwealth.timeseries.trends

import com.sirolf2009.commonwealth.timeseries.IPoint
import com.sirolf2009.util.GSonDTO
import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Data

@Data @GSonDTO class Extreme implements IExtreme, Serializable {
	
	val IPoint point
	val ExtremeType extremeType
	
}