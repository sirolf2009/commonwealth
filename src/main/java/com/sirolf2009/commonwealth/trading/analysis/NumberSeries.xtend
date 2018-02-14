package com.sirolf2009.commonwealth.trading.analysis

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Data
import java.util.Collection

@Data class NumberSeries extends ArrayList<Number> implements INumberSeries {
	
	new(Collection<? extends Number> values) {
		super(values)
	}
	
}