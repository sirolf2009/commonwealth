package com.sirolf2009.commonwealth.timeseries.trends

import com.sirolf2009.commonwealth.timeseries.ITimeseries
import java.util.List
import java.util.function.Function

interface ITrendFinder extends Function<ITimeseries, List<ITrend>> {
	
}