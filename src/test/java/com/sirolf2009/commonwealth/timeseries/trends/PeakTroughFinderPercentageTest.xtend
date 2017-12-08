package com.sirolf2009.commonwealth.timeseries.trends

import com.sirolf2009.commonwealth.timeseries.Point
import java.util.Optional
import junit.framework.Assert
import org.junit.Test
import com.sirolf2009.commonwealth.timeseries.Timeseries
import com.sirolf2009.commonwealth.timeseries.IPoint

class PeakTroughFinderPercentageTest {

	val points = #[
		new Point(0, 98d), // Trough
		new Point(1, 99d),
		new Point(2, 100d), // Peak
		new Point(3, 99d),
		new Point(4, 98d), // Trough
		new Point(5, 99d),
		new Point(6, 100d),
		new Point(7, 101d), // Peak
		new Point(8, 100d),
		new Point(9, 99d),
		new Point(10, 98d), // Trough
		new Point(11, 200d) // Peak
	].map[it as IPoint].toList()
	val series = new Timeseries(points)
	val threshold = 0.02

	@Test
	def void testPeakTroughFinder() {
		val expected = #[
			new Extreme(points.get(0), ExtremeType.TROUGH),
			new Extreme(points.get(2), ExtremeType.PEAK),
			new Extreme(points.get(4), ExtremeType.TROUGH),
			new Extreme(points.get(7), ExtremeType.PEAK),
			new Extreme(points.get(10), ExtremeType.TROUGH)
		]
		Assert.assertEquals(expected, new PeakTroughFinderPercentage(threshold).apply(series))
	}

	@Test
	def void testPeakTroughFinderFlat() {
		val points = #[
			new Point(0, 100d),
			new Point(1, 100d)
		].map[it as IPoint].toList()
		Assert.assertEquals(#[], new PeakTroughFinderPercentage(threshold).apply(new Timeseries(points)))
	}

	@Test
	def void testPeakFinder() {
		Assert.assertEquals(Optional.of(points.get(2)), new PeakTroughFinderPercentage(threshold).detectPeak(series, 0))
		Assert.assertEquals(Optional.of(points.get(7)), new PeakTroughFinderPercentage(threshold).detectPeak(series, 3))
	}

	@Test
	def void testTroughFinder() {
		Assert.assertEquals(Optional.of(points.get(0)), new PeakTroughFinderPercentage(threshold).detectTrough(series, 0))
		Assert.assertEquals(Optional.of(points.get(4)), new PeakTroughFinderPercentage(threshold).detectTrough(series, 1))
		Assert.assertEquals(Optional.of(points.get(10)), new PeakTroughFinderPercentage(threshold).detectTrough(series, 5))
	}

}
