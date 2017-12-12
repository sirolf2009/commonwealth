package com.sirolf2009.commonwealth.indicator

import com.sirolf2009.commonwealth.ITick
import java.util.function.Function

interface IIndicator<R> extends Function<ITick, R> {
	
}