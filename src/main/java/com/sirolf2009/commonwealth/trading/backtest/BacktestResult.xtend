package com.sirolf2009.commonwealth.trading.backtest

import com.sirolf2009.commonwealth.trading.IPosition
import java.util.List
import org.eclipse.xtend.lib.annotations.Data

@Data class BacktestResult implements IBacktestResult {
	
	val List<IPosition> trades
	
}