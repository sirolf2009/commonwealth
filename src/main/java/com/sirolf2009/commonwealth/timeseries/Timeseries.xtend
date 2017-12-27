package com.sirolf2009.commonwealth.timeseries

import com.sirolf2009.util.GSonDTO
import java.io.Serializable
import java.util.List
import org.eclipse.xtend.lib.annotations.Data
import org.eclipse.xtend.lib.annotations.Delegate

@Data @GSonDTO class Timeseries implements ITimeseries, Serializable {
	
	@Delegate
	val List<IPoint> points
	
	new(List<IPoint> points) {
		this.points = points.sortBy[x.doubleValue()].toList()
	}
	
}