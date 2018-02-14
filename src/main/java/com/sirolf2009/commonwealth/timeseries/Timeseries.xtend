package com.sirolf2009.commonwealth.timeseries

import java.io.Serializable
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Data

@Data class Timeseries extends ArrayList<IPoint> implements ITimeseries, Serializable {
	
	new(List<? extends IPoint> points) {
		super(points)
	}
	
}