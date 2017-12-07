package com.sirolf2009.commonwealth.timeseries.trends

import com.sirolf2009.commonwealth.timeseries.ITimeseries
import java.util.List
import java.util.function.Function

interface IPeakTroughFinder extends Function<ITimeseries, List<IExtreme>> {
	
}