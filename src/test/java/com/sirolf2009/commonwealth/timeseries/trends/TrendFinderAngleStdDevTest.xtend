package com.sirolf2009.commonwealth.timeseries.trends

import com.sirolf2009.commonwealth.timeseries.IPoint
import com.sirolf2009.commonwealth.timeseries.Point
import org.junit.Test
import com.sirolf2009.commonwealth.timeseries.Timeseries
import org.junit.Assert

class TrendFinderAngleStdDevTest {
	
	val points = new Timeseries(#[
		new Point(0, 98d), // new trend
		new Point(1, 99d),
		new Point(2, 100d),
		new Point(3, 99d), // new trend
		new Point(4, 98d),
		new Point(5, 99d),
		new Point(6, 100d),
		new Point(7, 101d),
		new Point(8, 100d), // new trend
		new Point(9, 99d),
		new Point(10, 98d), // new trend
		new Point(11, 200d)
	].map[it as IPoint].toList())
	
	@Test
	def void test() {
		val finder = new TrendFinderAngleStdDev(1)
		Assert.assertEquals(0.7853981633974483d, finder.getAngle(points, 0, 1), 0.00000001d)
		Assert.assertEquals(0.7853981633974483d, finder.getAngle(points, 0, 2), 0.00000001d)
		Assert.assertEquals(0.3217505543966422d, finder.getAngle(points, 0, 3), 0.00000001d)
		Assert.assertEquals(0d, finder.getAngle(points, 0, 4), 0.00000001d)
		Assert.assertEquals(0d, finder.getStandardDeviation(points, 0, 1), 0.00000001d)
		Assert.assertEquals(0d, finder.getStandardDeviation(points, 0, 2), 0.00000001d)
		Assert.assertEquals(0.8606629658238693d, finder.getStandardDeviation(points, 0, 3), 0.00000001d)
		Assert.assertEquals(1.224744871391589d, finder.getStandardDeviation(points, 0, 4), 0.00000001d)
//		Assert.assertEquals(#[0, 3, 8, 10], finder.apply(points).map[from.x.intValue].toList)
	}
	
}