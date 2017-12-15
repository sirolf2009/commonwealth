package com.sirolf2009.commonwealth.timeseries

import com.sirolf2009.util.GSonDTO
import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Data

@Data @GSonDTO class Point implements IPoint, Serializable {
	
	val Number x
	val Number y
	
}