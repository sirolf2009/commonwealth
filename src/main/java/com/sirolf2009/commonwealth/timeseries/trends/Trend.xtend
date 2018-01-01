package com.sirolf2009.commonwealth.timeseries.trends

import com.sirolf2009.commonwealth.timeseries.IPoint
import org.eclipse.xtend.lib.annotations.Data

@Data class Trend implements ITrend {
	val IPoint from
	val IPoint to
}